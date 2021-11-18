from functools import wraps

from django.http import JsonResponse
from apis.models import AppVersion

def AppVersion_required(view_func):

    def _decorator(request, *args, **kwargs):
        # maybe do something before the view_func call
        appVersion = request.META.get('HTTP_APPVERSION')  
        latestVersion = AppVersion.objects.latest('createTime')    
        if appVersion is None:
            return JsonResponse({"message" : "AppVersion is Missing.", "status":"0"}, status=500)
        elif latestVersion.version != appVersion:
            return JsonResponse({"message" : "Your App Version is obsolete.Please install the latest one.", "status":"0"}, status=426)
        response = view_func(request, *args, **kwargs)
        # maybe do something after the view_func call
        return response

    return wraps(view_func)(_decorator)
