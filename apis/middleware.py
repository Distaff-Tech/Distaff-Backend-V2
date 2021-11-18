from rest_framework.authtoken.models import Token
# from apis.models import User
# from django.http import JsonResponse
# from django.utils import timezone


# class SimpleMiddleware(object):

#     def __init__(self, get_response):
#         self.get_response = get_response
#         # One-time configuration and initialization.

#     def __call__(self, request):
#         # Code to be executed for each request before
#         # the view (and later middleware) are called.
#         # print "i am called before request......"
#         # print request.POST, "data"
#         API_key = request.META.get('HTTP_AUTHORIZATION')
#         if API_key is not None: 
#             try:
#                 token1 = Token.objects.get(key=API_key)
#                 print("3", tokent1)
#                 user = token1.user
#                 print("4", user)
#                 checkGroup1 = user.groups.filter(name='User').exists()
#                 checkGroup2 = user.groups.filter(name='Admin').exists()
#                 printr("5", "hello")
#             except:
#                 checkGroup1 = False
#                 checkGroup2 = False

#             if checkGroup1 or checkGroup2:
#                 currentTime = timezone.now().replace(second=0, microsecond=0)
#                 print("2", currentTime)
#                 if user.lastUpdated is None:
#                     try:
#                         updated = User.objects.filter(id=user.id).update(lastUpdated=currentTime)
#                         print("1", updated)
#                     except:
#                         pass
#                 else:
#                     updated = User.objects.filter(id=user.id).update(lastUpdated=currentTime)
#                         # print("2", updated)

#             response = self.get_response(request)
        
#         return response




