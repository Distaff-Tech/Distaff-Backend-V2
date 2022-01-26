

from django.shortcuts import render
from rest_framework.decorators import api_view,renderer_classes
from django.views.decorators.csrf import csrf_exempt
from django.db import transaction
from apis.models import *
from apis.serializers import *
from rest_framework.response import Response
from rest_framework import status
from multiprocessing import Lock
from django.http import JsonResponse
from django.core.serializers.json import DjangoJSONEncoder
import json
from django.core.mail import EmailMessage
from commons.constant import *
import traceback
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import Group
import base64
from django.db.models import F
import os 
from django.db.models import Q
import uuid 
from pyfcm import FCMNotification
from django.db import connection
from django.conf import settings
from django.core.files.storage import default_storage
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator    
import base64, random, pytz
from django.contrib.auth.hashers import make_password
import datetime
from django.core.files.storage import FileSystemStorage
from pytz import timezone
from django.utils import timezone
from django.core.paginator import Paginator
from apis.models import VerifyLog as VerifyLogModel
import stripe
from django.http import JsonResponse
from apis.decorators import AppVersion_required
from django.urls import reverse
import math
from django.db.models import Value
from django.db.models.query import QuerySet
from django.db.models import Avg, Max, Min, Sum, Count

#=======================================
#subscriber on NewsLetter
#========================================

@csrf_exempt
@api_view(['POST'])
def SubScribe(request):
    try:
        with transaction.atomic():
            #received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                user = Subscribe.objects.get(email = request.data['email'])
                return Response({"message" : errorSubEmailExist, "status" : "0"}, status=status.HTTP_409_CONFLICT)
            except:
                subuser = Subscribe.objects.create(email = request.data['email'])
                
                return Response({"message" : addSubSuccessMessage,"status" : "1"}, status=status.HTTP_201_CREATED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#===============================
#Reach Us Distaff
#================================

@api_view(['POST'])
def ReachUsEmail(request):
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            name = request.data['name']
            phone = request.data['phone']
            email = request.data['email']
            subject = request.data['subject']
            message = request.data['message']
            email_body = """\
                        <html>
                          <head>Dear</head>
                          <body>
                            <h2>%s</h2>
                            <p>%s</p>
                            <p> This email was sent from: </p>
                            <h5>%s</h5>
                            <h5>email:%s</h5>
                          </body>
                        </html>
                        """ % (subject, message,name, email)
            email = EmailMessage('Contact Us Mail ! ', email_body, to=['sam.costich@distaff.app'])
            email.content_subtype = "html"  # this is the crucial part
            response = email.send()
            if response:
                contact = ReachUs.objects.create( name = name,
                                                    phone = phone,
                                                    email = request.data['email'],
                                                    subject = subject,
                                                    message = message,
                                                   )
                if contact is not None:    
                    return Response({"status": "1", 'message': 'Query submitted successfully.'}, status=status.HTTP_200_OK)
                else:
                    return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)           
            
    except:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#===========================
#Sign Up
#=============================


# @AppVersion_required
@csrf_exempt
@api_view(['POST'])
def SignUp(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            user = User.objects.filter(email = received_json_data['email'])
            if len(user)>0:
                return Response({"message" : errorEmailExist, "status" : "0"}, status=status.HTTP_201_CREATED)
            else:
                authuser = User.objects.create(email = received_json_data['email'],
                                                phone = received_json_data['phone'],
                                                username = received_json_data['email'],
                                                password = make_password(received_json_data['password']),
                                                deviceId = received_json_data['deviceId'],
                                                deviceType = received_json_data['deviceType'])
                g = Group.objects.get(name='User')
                g.user_set.add(authuser)
                if authuser:
                    userobj = User.objects.get(id=authuser.id)
                    token1 = Token.objects.create(user=authuser)
                    b64UserId = urlsafe_base64_encode(str(userobj.id).encode('utf-8'))
                    myUserToken = default_token_generator.make_token(userobj)
                    
                    # nowTime = timezone.now().replace(tzinfo=None).replace(microsecond=0)
                    nowTime = datetime.datetime.now().replace(tzinfo=None).replace(microsecond=0)
                    VerifyLogModel.objects.create(id=uuid.uuid4(),
                                         user_id=authuser.id,
                                         code=myUserToken,
                                         created_time = nowTime)
                    projectUrl = request.build_absolute_uri('/')[:]
                    
                    verifyLinkUrl = projectUrl + "verifymail?uid=" + b64UserId + "&token=" + myUserToken
                    email_body = 'Dear '+ received_json_data['email'] +',\n Use link below to verify your email \n'+ verifyLinkUrl +"\nIf clicking the link above doesn't work, please copy and paste the URL in a new browser window instead. \n" +'\nSincerly, \n' +'Distaff Team \n'
                    try:
                        data={ 'email_subject': 'Distaff Verification Mail', 'email_body': email_body, 'to_email': received_json_data['email']}
                        email = EmailMessage(
                            subject=data['email_subject'], body=data['email_body'],to=[data['to_email']])
                        response = email.send()
                    except Exception as e:
                                pass
                    
                    ### Old NetScape method ###
                    # list = []
                    # list.append(request.data['email'])
       
                    # try:
                    #     subject = "Verification Mail"

                    #     email_body = """\
                    #         <html>
                    #             <head></head>
                    #             <body>
                    #                 <h2>Dear Distaff User, </h2>
                    #                 <p> To initiate the verification process,
                    #                 Please click the link below:</p>
                    #                 <p> %s </p>
                    #                 <p>If clicking the link above doesn't work, please copy and paste the URL in a new browser
                    #                 window instead.</p>
                    #                 <p>Sincerely, </p>
                    #                 <p>Distaff Team 
                    #                 </p>
                    #             </body>
                    #         </html>
                    #         """ %(verifyLinkUrl)
                    #     email = EmailMessage(subject= 'Email Verification Mail! ', body = email_body, to=request.data['email']) #Changed by Abdou
                    #     email.content_subtype = "html"
                    #     email.send()
                        
                    except Exception as e:
                        pass
                    return Response(
                        {"message": "A verification link has been sent to your email account. If you do not receive a confirmation email, please check your spam folder. Also, please verify that you entered a valid email address in our sign-up form. "},status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def verifymail(request):
    receivedUid = request.GET['token']
    b64UserId = request.GET['uid']     
    b64UserDId = urlsafe_base64_decode(b64UserId)
    userobj1 = User.objects.get(id=b64UserDId)
    try:
        codeExist = VerifyLogModel.objects.filter(code=receivedUid).filter(user_id=userobj1.id).latest('created_time')        
        
    except:
        codeExist = None    
    if codeExist is not None and codeExist.codeUsed == 0:
        VerifyLogModel.objects.filter(user_id=userobj1.id).update(codeUsed = 1)
        User.objects.filter(id = userobj1.id).update(is_email_verified = 1)
        return render(request,"passwordReset/VerifyEmaildone.html")
    else:
        print(traceback.format_exc())
        return render(request,"passwordReset/VerifyEmailnotdone.html")


#================================================
# UPDATE DEVICE ID
#================================================
#@AppVersion_required
@api_view(['POST'])
def UpdateDeviceId(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            device_Id = received_json_data['deviceId']
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='User').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)

                if device_Id is not None:
                    User.objects.filter(id = user.id).update(deviceId = device_Id)
                    return Response({"message" : "DeviceId has been changed"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : "DeviceId is null"}, status=status.HTTP_200_OK)
    
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
 
#==================================================
#send verify link
# ================================================== 

@AppVersion_required
@api_view(['POST'])
def SendVerifyLink(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                emailExist = User.objects.get(email = received_json_data['email'])
            except Exception as e:
                return Response ({"message": "This email does not exist", "status": "0"},status=status.HTTP_404_NOT_FOUND)
            if emailExist:   
                userobj = User.objects.get(id=emailExist.id)
                b64UserId = urlsafe_base64_encode(str(userobj.id).encode('utf-8'))
                myUserToken = default_token_generator.make_token(userobj)
                nowTime = datetime.datetime.now().replace(tzinfo=None).replace(microsecond=0)
                ForgetPasswordLog.objects.create(id=uuid.uuid4(),
                                         user_id=emailExist.id,
                                         code=myUserToken,
                                         createdTime= nowTime
                                         )
                projectUrl = request.build_absolute_uri('/')[:]

                verifyLinkUrl = projectUrl + "validateuser?uid=" + b64UserId + "&token=" + myUserToken
                list = []
                list.append(request.data['email'])
                try:
                    subject = "Verification Mail"

                    email_body = """\
                        <html>
                            <head></head>
                            <body>
                                <h2>Dear %s, </h2>
                                <p> To initiate the verification process,
                                 Please click the link below:</p>
                                <p> %s </p>
                                <p>If clicking the link above doesn't work, please copy and paste the URL in a new browser
                                window instead.</p>
                                <p>Sincerely, </p>
                                <p>Distaff Team 
                                </p>
                            </body>
                        </html>
                        """ %(emailExist.fullname, verifyLinkUrl)
                    email = EmailMessage('Email Verification Mail! ', email_body, to=list)
                    email.content_subtype = "html"
                    response = email.send()
                except Exception as e:
                    pass

                return Response(
                        {"message": "An email has been sent to verify your email", "status": "1", "url": verifyLinkUrl},status=status.HTTP_200_OK)
            
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# ===============================================
# method for verify email
# ===============================================


def validateuser(request):
    receivedUid = request.GET['token']
    b64UserId = request.GET['uid']
    b64UserDId = urlsafe_base64_decode(b64UserId)
    userobj1 = User.objects.get(id=b64UserDId)
    try:
        codeExist = ForgetPasswordLog.objects.filter(code=receivedUid).filter(user_id=userobj1.id).latest('createdTime')
    except:
        codeExist = None
    if codeExist is not None and codeExist.codeUsed == 0:
        context = {'validlink': True, 'userId': b64UserId}
        return render(request, 'passwordReset/Reset_pwd.html',context)
    else:
        print(traceback.format_exc())
        context = {'validlink': False}
        return render(request, 'passwordReset/Reset_pwd.html',context)
# =====================================
# Forget Password
# =========================================
@csrf_exempt
@api_view(['POST'])
def ForgetPassword(request):
    try:
        with transaction.atomic():
            b64Id = request.data['uid']
            b64UserDId = urlsafe_base64_decode(b64Id)
            newPassword = request.data['newPassword']
            user = User.objects.get(id=b64UserDId)
            if user.password == newPassword:
                return Response({"message": "You have used an old password!!", "status": "0"},
                                status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            u = User.objects.get(id=user.id)
            u.set_password(newPassword)
            u.save()
            userUpdate = User.objects.filter(id=user.id).update(password=make_password(newPassword))
            if userUpdate:
                rec = ForgetPasswordLog.objects.filter(user_id=user.id).latest('createdTime')
                if rec is not None:
                    ForgetPasswordLog.objects.filter(id=rec.id).update(codeUsed=1)
                    print(rec)
                return Response({"message": "Password reset successfully!!", "status": "1"},
                                status=status.HTTP_201_CREATED)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#==============================================
# Method for term and condition 
#===============================================

def Terms_Conditions(request):
    return render(request, "passwordReset/term&conditions.html")

    

#==============================================
# Method for Privacy Policy 
#===============================================

def privacy_policy(request):
    return render(request, "passwordReset/privacy.html")

#========================================
# Method for Cancel policy
#========================================

def cancel_policy(request):
    return render(request, "passwordReset/cancel.html")



#========================================
# api for login user
#========================================
#@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def Applogin(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            deviceId = received_json_data['deviceId']
            deviceType = received_json_data['deviceType']
            user = authenticate(username=received_json_data['email'], password=received_json_data['password'])
            nowTime = datetime.datetime.now()
            if user:
                if user.is_email_verified == -1:
                    return Response({"message" : "Please verify your email first"}, status=status.HTTP_201_CREATED)
                else:
                    if deviceId !="":
                        User.objects.filter(id=user.id).update(deviceId = deviceId,deviceType = deviceType,login_type='e',lastUpdated = nowTime)
                        if user is not None:
                            if user.is_active:
                                token = ''
                                try:
                                    user_with_token = Token.objects.get(user=user)
                                except:
                                    user_with_token = None
                                
                                if user_with_token is None:
                                    token1 = Token.objects.create(user=user)
                                    token = token1.key
                                else:
                                    Token.objects.get(user=user).delete()
                                    token1 = Token.objects.create(user=user)
                                token = token1.key
                                user1 = User.objects.get(id = user.id)

                                if user.is_pro_created == False:
                                    userDetail = {
                                                    "id" : user.id,
                                                    "token": token,
                                                    "email":user.email,
                                                    "phone":user.phone,
                                                    "fullname":user.fullname,
                                                    "address":user.address,
                                                    "date_of_birth":user.date_of_birth,
                                                    "gender":user.gender,
                                                    "about_me":user.about_me,
                                                    "login_type": user1.login_type,
                                                    "user_name":user.user_name,
                                                    "deviceId":deviceId,
                                                    "deviceType": deviceType,
                                                    "is_profile_created": user.is_pro_created,
                                                    "image":user.image,
                                                    "notificationStatus": user.onoffnotification
                                                    }
                                    return Response({"message" : errorIncompleteProfile,"response":userDetail}, status=status.HTTP_200_OK) #This will represent missing invite friends

                                else:
                                    userDetail = {
                                                    "id" : user.id,
                                                    "token" : token,
                                                    "email":user.email,
                                                    "phone":user.phone,
                                                    "fullname":user.fullname,
                                                    "address":user.address,
                                                    "date_of_birth":user.date_of_birth,
                                                    "gender":user.gender,
                                                    "about_me":user.about_me,
                                                    "login_type": user.login_type,
                                                    "user_name":user.user_name,
                                                    "deviceId":deviceId,
                                                    "deviceType": deviceType,
                                                    "is_profile_created": user.is_pro_created,
                                                    "image": user.image,
                                                    "notificationStatus": user.onoffnotification
                                                    }
                                    return Response({"message" : loginSuccessMessage, "response":userDetail}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : errorBlockedAcount}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorEmailPasswordIncorrect}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#====================================================
# social login via instagram,facebook,gmail
#====================================================
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def SocialLogin(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            nowTime = datetime.datetime.now()
            deviceId = received_json_data['deviceId']
            deviceType=received_json_data['deviceType']
            social_id=received_json_data['social_id']
                       
            if social_id != "":
                try:
                    user1 = User.objects.get(social_id=social_id)
                except: 
                    user1 = None
                if user1 is not None:  
                    authuser = authenticate(username=social_id, password=social_id)
                    if authuser:
                        if deviceId != "":
                            User.objects.filter(id = user1.id).update(deviceId = deviceId,deviceType=deviceType)
                            user2 = User.objects.get(id = user1.id)
                   
                        token = ''
                        try:
                            user_with_token = Token.objects.get(user=authuser)
                        except:
                            user_with_token = None

                        if user_with_token is None:
                            token1 = Token.objects.create(user=authuser)
                            token = token1.key
                        else:
                            Token.objects.get(user=authuser).delete()
                            token1 = Token.objects.create(user=authuser)
                            token = token1.key
                        if user2.is_pro_created == False:

                            userDetail = {
                                            "id" : user2.id,
                                            "token": token,
                                            "email" : user2.email,
                                            "fullname" : user2.fullname,
                                            "gender" : user2.gender,
                                            "about_me" : user2.about_me,
                                            "social_id" : user2.social_id,
                                            "image": user2.image,
                                            "user_name" : user2.user_name,
                                            "login_type" : user2.login_type,
                                            "date_of_birth" : user2.date_of_birth,
                                            "phone" : user2.phone,
                                            "address" : user2.address,
                                            "deviceId" :  user2.deviceId,
                                            "deviceType" : user2.deviceType,
                                            "created_time" : user2.created_time,
                                            "is_profile_created" :user2.is_pro_created,  
                                            "notificationStatus" : user2.onoffnotification,
                                        }
                            return Response({"message" : errorIncompleteProfile, "response": userDetail}, status=status.HTTP_200_OK)
                        else:
                            userDetail = {
                                             "id" : user2.id,
                                            "token": token,
                                            "email" : user2.email,
                                            "fullname" : user2.fullname,
                                            "gender" : user2.gender,
                                            "about_me" : user2.about_me,
                                            "social_id" : user2.social_id,
                                            "image": user2.image,
                                            "user_name" : user2.user_name,
                                            "login_type" : user2.login_type,
                                            "date_of_birth" : user2.date_of_birth,
                                            "phone" : user2.phone,
                                            "address" : user2.address,
                                            "deviceId" :  user2.deviceId,
                                            "deviceType" : user2.deviceType,
                                            "created_time" : user2.created_time,
                                            "is_profile_created" :user2.is_pro_created,   
                                            "notificationStatus" : user2.onoffnotification,
                                        }
                            return Response({"message" : loginSuccessMessage,"response":userDetail}, status=status.HTTP_200_OK)
                elif (received_json_data['login_type'] == "f" or received_json_data['login_type'] == "g"):
                    email = received_json_data['email']
                    user = User.objects.filter(email = email).exists()
                    if user:
                        return Response({"message" : errorEmailExist}, status=status.HTTP_409_CONFLICT)
                    else:
                        user = User.objects.create(username = received_json_data['social_id'],
                                            social_id = received_json_data['social_id'],
                                            email = received_json_data['email'],
                                            password = make_password(received_json_data['social_id']),
                                            deviceId = received_json_data['deviceId'],
                                            deviceType = received_json_data['deviceType']
                                            )

                        if user is not None:
                            if received_json_data['login_type'] == "f":
                                User.objects.filter(id = user.id).update(login_type = LOGIN_TYPE_STATUS_F)
                            if received_json_data['login_type'] == "g":
                                User.objects.filter(id = user.id).update(login_type = LOGIN_TYPE_STATUS_G)
                                                       
                            g = Group.objects.get(name='User')
                            g.user_set.add(user)
                            token = ''
                            try:
                                user_with_token = Token.objects.get(user=user)
                            except:
                                user_with_token = None
                            if user_with_token is None:
                                token1 = Token.objects.create(user=user)
                                token = token1.key
                            else:
                                Token.objects.get(user=user).delete()
                                token1 = Token.objects.create(user=user)
                                token = token1.key
                            user = User.objects.get(id =user.id)


                            userdetail = {
                                            "id" : user.id,
                                            "token": token,
                                            "email" : user.email,
                                            "fullname" : user.fullname,
                                            "gender" : user.gender,
                                            "about_me" : user.about_me,
                                            "social_id" : user.social_id,
                                            "image": user.image,
                                            "user_name" : user.user_name,
                                            "login_type" : user.login_type,
                                            "date_of_birth" : user.date_of_birth,
                                            "phone" : user.phone,
                                            "address" : user.address,
                                            "deviceId" :  user.deviceId,
                                            "deviceType" : user.deviceType,
                                            "created_time" : user.created_time,
                                            "is_profile_created" :user.is_pro_created, 
                                            "notificationStatus" : user.onoffnotification,
                                        }
                            return Response({"message" : loginSuccessMessage,"response":userdetail}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                else:
                    if received_json_data['login_type'] == "i":
                        user = User.objects.create(username = received_json_data['social_id'],
                                            social_id = received_json_data['social_id'],
                                            password = make_password(received_json_data['social_id']),
                                            deviceId = received_json_data['deviceId'],
                                            deviceType = received_json_data['deviceType']
                                            )
                        if user is not None:
                            if received_json_data['login_type'] == "i":
                                User.objects.filter(id = user.id).update(login_type = LOGIN_TYPE_STATUS_I)
                                g = Group.objects.get(name='User')
                                g.user_set.add(user)
                                token = ''
                                try:
                                    user_with_token = Token.objects.get(user=user)
                                except:
                                    user_with_token = None
                                if user_with_token is None:
                                    token1 = Token.objects.create(user=user)
                                    token = token1.key
                                else:
                                    Token.objects.get(user=user).delete()
                                    token1 = Token.objects.create(user=user)
                                    token = token1.key
                                
                                userdetail = {
                                            "id" : user.id,
                                            "token": token,
                                            "email" : user.email,
                                            "fullname" : user.fullname,
                                            "gender" : user.gender,
                                            "about_me" : user.about_me,
                                            "social_id" : user.social_id,
                                            "image": user.image,
                                            "user_name" : user.user_name,
                                            "date_of_birth" : user.date_of_birth,
                                            "phone" : user.phone,
                                            "address" : user.address,
                                            "deviceId" :  user.deviceId,
                                            "deviceType" : user.deviceType,
                                            "created_time" : user.created_time,
                                            "is_profile_created" :user.is_pro_created, 
                                            "notificationStatus" : user.onoffnotification,
                                        }
                                return Response({"message" : loginSuccessMessage,"response":userdetail}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#======================================
# api for create user profile
#======================================
#@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def CreateProfile(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='User').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        user_name = received_json_data['user_name']
                        fullname = received_json_data['fullname']
                        address = received_json_data['address']
                        gender = received_json_data['gender']
                        # date_of_birth = received_json_data['date_of_birth']
                        about_me = received_json_data['about_me'] 
                        date_of_birth = datetime.datetime.strptime(received_json_data['date_of_birth'], '%Y-%m-%d')
                        is_from_edit = received_json_data['is_from_edit']
                        if is_from_edit == 1:
                            User.objects.filter(id=user.id).update(user_name = user_name,fullname=fullname,address=address,gender=gender,about_me=about_me,date_of_birth = date_of_birth)
                            user1 = User.objects.get(id = user.id)
                            if user1:
                                file = request.FILES.get('image')
                                imageUrl = ""
                                if file is not None:
                                    fs = FileSystemStorage()
                                    filename = fs.save("profileimages/"+str(user.id)+"/"+file.name, file)
                                    uploaded_file_url = fs.url(filename)
                                    User.objects.filter(id = user.id).update(image = uploaded_file_url)
                                    user2 = User.objects.get(id = user.id)
                                    imageUrl = user2.image
                                    userDetail = {
                                        "user_name": user1.user_name,
                                        "fullname" : user1.fullname,
                                        "address": user1.address,
                                        "gender": user1.gender,
                                        "about_me": user1.about_me,
                                        "date_of_birth":user1.date_of_birth,
                                        "image":imageUrl
                                        }
                                    return Response({ 'message': addSuccessMessage, 'data':userDetail}, status=status.HTTP_200_OK)       
                                else:
                                    userDetail = {
                                        "user_name": user1.user_name,
                                        "fullname" : user1.fullname,
                                        "address": user1.address,
                                        "gender": user1.gender,
                                        "about_me": user1.about_me,
                                        "date_of_birth":user1.date_of_birth,
                                        "image":user.image
                                        }
                                    return Response({ 'message': addSuccessMessage, 'data':userDetail}, status=status.HTTP_200_OK)       
                            else:
                                return Response({"message" : errorMessage}, status=status.HTTP_201_CREATED)
                        else:  
                            user1 = User.objects.filter(user_name = user_name).exists()
                            if user1:    
                                return Response({"message" : "username already exist", "status" : "0"}, status=status.HTTP_409_CONFLICT)
                            else:
                                date_of_birth = datetime.datetime.strptime(received_json_data['date_of_birth'], '%Y-%m-%d')
                                User.objects.filter(id=user.id).update(user_name = user_name,fullname=fullname,address=address,gender=gender,about_me=about_me,date_of_birth = date_of_birth,is_pro_created =1)
                                user1 = User.objects.get(id = user.id)
                                if user1:
                                    file = request.FILES.get('image')
                                    imageUrl = ""
                                    if file is not None:
                                        fs = FileSystemStorage()
                                        filename = fs.save("profileimages/"+str(user.id)+"/"+file.name, file)
                                        uploaded_file_url = fs.url(filename)
                                        User.objects.filter(id = user.id).update(image = uploaded_file_url)
                                        user2 = User.objects.get(id = user.id)
                                        imageUrl = user2.image
                                    userDetail = {
                                                "user_name": user1.user_name,
                                                "fullname" : user1.fullname,
                                                "address": user1.address,
                                                "gender": user1.gender,
                                                "about_me": user1.about_me,
                                                "date_of_birth":user1.date_of_birth,
                                                "image":imageUrl
                                                }
                                    return Response({ 'message': addSuccessMessage, 'data':userDetail}, status=status.HTTP_200_OK)
                                else:
                                    return Response({"message" : errorMessage}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    

#==========================================
# api for change password
#==========================================
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def ChangePassword(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message": "Session expired!! please login again", "status": "0"},
                                    status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    
                    currentPassword = received_json_data['currentPassword']
                    success = user.check_password(currentPassword)
                    if success:
                        if currentPassword == received_json_data['newPassword']:
                            return Response({"message": "Please Enter a Different Password", "status": "0"},
                                            status=status.HTTP_406_NOT_ACCEPTABLE)
                        else:
                            u = User.objects.get(id=user.id)
                            u.set_password(received_json_data['newPassword'])
                            result = User.objects.filter(id=user.id).update(
                                password=make_password(received_json_data['newPassword']))
                            if result:
                                return Response({"message": "Password updated Successfully"}, status=status.HTTP_200_OK)
                            else:
                                return Response({"message": "Password not updated successfully"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        return Response({"message": "Please enter the correct old password", "status": "0"}, status=status.HTTP_406_NOT_ACCEPTABLE)
                    
                else:
                    return Response({"message": errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage}, status=status.HTTP_401_UNAUTHORIZED)

    except Exception:
        print(traceback.format_exc())
        return Response({"message": errorMessage}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


# @csrf_exempt
# @api_view(['PUT'])
# def update_profile_info(request):
#     try:
#         with transaction.atomic():
#             #received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
#             received_json_data = json.loads(request.data['data'], strict=False)
#             try:
#                 api_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=api_key)
#                 user = token1.user
#             except:
#                 print(traceback.format_exc())
#                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            
#             a = User.objects.filter(user_name = received_json_data['user_name']).exists()
#             if a:    
#                 return Response({"message" : errorUserNameExist, "status" : "0"}, status=status.HTTP_409_CONFLICT)
            
#             else:  
#                 user1 = User.objects.filter(id = user.id).update(
#                                     email = received_json_data['email'],
#                                     fullname = received_json_data['fullname'],
#                                     gender = received_json_data['gender'],
#                                     dob =received_json_data['dob'],
#                                     about_me =received_json_data['about_me'],
#                                     address = received_json_data['address'],
#                                     user_name = received_json_data['user_name']
#                                 )
#                 print(user1)                   
#                 if user1:
#                     file = request.FILES.get('image')
#                     if file is not None:
#                         fs = FileSystemStorage()
#                         filename = fs.save("profileimages/"+str(user.id)+"/"+file.name, file)
#                         uploaded_file_url = fs.url(filename)
#                         User.objects.filter(id = user.id).update(image = uploaded_file_url)
                    
#                     user = User.objects.get(id = user.id)
#                     user_detail = {"last_login" : user.last_login,
#                                     "user_name" : user.user_name,
#                                     "email" : user.email,
#                                     "fullname" : user.fullname,
#                                     "dob" : user.dob,
#                                     "about_me" : user.about_me,
#                                     "address" : user.address,
#                                     "gender" : user.gender,
#                                     "image":user.image
#                                     }
#                     print(user_detail)
#                     return Response({"message" : addSuccessMessage, "status" : "1","user_detail":user_detail}, status=status.HTTP_200_OK)
#                 else:
#                     return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#========================================
# API for add new address
#========================================
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def addAddress(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            address = Addresses.objects.create(first_name = received_json_data['first_name'],
            last_name = received_json_data['last_name'],
            phone = received_json_data['phone'],
            address = received_json_data['address'],
            city = received_json_data['city'],
            postal_code = received_json_data['postal_code'],
            user_id = user.id,
            status = 1)
            address_detail = {
                    
                    "message":addAddressSuccessMessage,
                    "id" : address.id,
                    "first_name":address.first_name,
                    "last_name": address.last_name,
                    "phone": address.phone,
                    "city": address.city,
                    "postal_code": address.postal_code,
                    "address": address.address,
                    
                }
            if address is not None:
                return Response(address_detail, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=========================================
# API for delete address
#=========================================
@AppVersion_required
@api_view(['POST'])
def deleteAddress(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            address = Addresses.objects.filter(user_id = user.id,id = received_json_data['address']).update(status=0)
            
            if address:
                return Response({"message" : deleteSuccessMessage}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)  
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=====================================
# API for get list of address
#=====================================
@AppVersion_required
@api_view(['GET'])
def getAddresses(request):
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            
            last_ad = OrderTrn.objects.filter(user_id = user.id).order_by('-transaction_time').first()
    
            address = Addresses.objects.filter(user_id = user.id,status=1).order_by('-created_time')
            serializer = AddressesSerializer(address,many=True).data
            if serializer:
                if last_ad:
                        a = last_ad.address
                        b = a.id
                        for c in serializer:
                            if c['id'] == b:
 
                                c['default_address'] = True
                            else:
                                c['default_address'] = False

                        return Response({"message":"Addresses Fetched successfully","data":serializer}, status=status.HTTP_200_OK)
                else:
                    for data in serializer:
                        data['default_address'] = False
                    return Response({"message":"Addresses Fetched successfully", "data":serializer}, status=status.HTTP_200_OK)
            else:
                return Response({"message":"Addresses Fetched successfully", "data":serializer}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#================================
#contact us 
#=================================
@AppVersion_required
@api_view(['POST'])
def ContactUsEmail(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            if checkGroup :
                fullname = received_json_data['fullname']
                email = received_json_data['email']
                subject = received_json_data['subject']
                message = received_json_data['message']
                email_body = """\
                            <html>
                              <head></head>
                              <body>
                                <h2>%s</h2>
                                <p>%s</p>
                                <p> This email was sent from: </p>
                                <h5>%s</h5>
                                <h5>email:%s</h5>
                              </body>
                            </html>
                            """ % (subject, message, fullname, email)
                email = EmailMessage('Contact Us Mail ! ', email_body, to=['chaudharymark@gmail.com'])
                email.content_subtype = "html"  # this is the crucial part
                response = email.send()
                if response:
                    contact = ContactUs.objects.create( fullname = fullname,
                                                        email = received_json_data['email'],
                                                        subject = subject,
                                                        message = message,
                                                        user_id = user.id)
                    if contact is not None:    
                        return Response({"status": "1", 'message': 'Email sent successfully.'}, status=status.HTTP_200_OK)
                    else:
                        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                else:
                    return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)           
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#===================================
# logout app user
#===================================
# @AppVersion_required
@api_view(['GET'])
def logoutAppUser(request):
    try:
        with transaction.atomic():
            API_KEY = request.META.get('HTTP_AUTHORIZATION')
            if API_KEY is not None:
                try:
                    token1 = Token.objects.get(key=API_KEY)
                    user = token1.user
                except:
                    token1=None
                    user=None
                if user is not None:
                    user.auth_token.delete()
                    return Response({"message": "Logged out successfully", "status": "1"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message": "session Expired ! Please Login Again.", "status": "0"},
                                    status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#====================================
#GET size and colour
#=====================================

@AppVersion_required
@api_view(['GET'])
def getFabricSizeColour(request):  
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            fabric = Fabric.objects.all() 
            size = Size.objects.all()
            colour = Colour.objects.all()                             
            fabricserializer = FabricSerializer(fabric,many=True)
            sizeserializer = SizeSerializer(size,many=True)
            colourserializer = ColourSerializer(colour,many=True)
            minprice = 15.78
            return Response({"fabric":fabricserializer.data,"size":sizeserializer.data,"colour":colourserializer.data,"minimumPrice":minprice}, status=status.HTTP_200_OK)      
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#==================================
# api for add post
#==================================

# @api_view(['POST'])
# def addPost(request):
#     try:
#         with transaction.atomic():
#             received_json_data = json.loads(request.data['data'], strict=False)
#             try:
#                 API_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=API_key)
#                 user = token1.user
#                 checkGroup = user.groups.filter(name='User').exists()
#                 if checkGroup == False:
#                     return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             except:
#                 return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
#             user1 = User.objects.get(id = user.id)
#             print(user1)
#             size = list(received_json_data['size'])
#             # colour = list(received_json_data['colour'])
#             fabric = list(received_json_data['fabric'])
#             post = Post.objects.create(price = received_json_data['price'],
#                                         post_description = received_json_data['post_description'],
#                                         user_id = user1.id,
#                                         post_status = 1)
           
#             if post is not None:
#                 post_count = user1.post_count
#                 User.objects.filter(id = user.id).update(post_count = post_count+1)
#                 for element in size:
#                     RelPostSize.objects.create(post_id = post.id,
#                                                 size_id = element)
#                 for data in fabric:
#                     RelPostFabric.objects.create(post_id=post.id,
#                                                 fabric_id=data)
#                 file = request.FILES.get('post_image')
#                 print(file)
#                 fs = FileSystemStorage()
#                 filename = fs.save("postimages/"+str(post.id)+"/"+file.name, file)
#                 uploaded_file_url = fs.url(filename)
#                 Post.objects.filter(id = post.id).update(post_image = uploaded_file_url)
#                 return Response({"message" : addPostSuccessMessage, "status" : "1"}, status=status.HTTP_201_CREATED)
#             else:
#                 return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@AppVersion_required
@api_view(['POST'])
def addPost(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
            size = list(received_json_data['data']['size'])
            colour = list(received_json_data['data']['colour'])
            fabric = list(received_json_data['data']['fabric'])
            post = Post.objects.create(price = received_json_data['data']['price'],
                                        post_description = received_json_data['data']['post_description'],
                                        user_id = user.id,
                                        created_time = nowTime,
                                        post_status = 1)
           
            if post is not None:
                post_count = user.post_count
                User.objects.filter(id = user.id).update(post_count = post_count+1)
                for element in size:
                    RelPostSize.objects.create(post_id = post.id,
                                                size_id = element)
                for data1 in fabric:
                    RelPostFabric.objects.create(post_id=post.id,
                                                fabric_id=data1)
                list_files = request.FILES.getlist('post_images')
                for file,data3 in zip(list_files, colour):
                    fs = FileSystemStorage()
                    filename = fs.save("postimages/"+str(post.id)+"/"+file.name, file)
                    uploaded_file_url = fs.url(filename)
                    aa = PostImage.objects.create(post_images = uploaded_file_url,post_id = post.id,colour_id = data3)
                return Response({"message" : addPostSuccessMessage, "status" : "1"}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#===========================================================
# Get POst by id
#===========================================================

# @csrf_exempt
# @api_view(['GET'])
# def getPost(request,pk):
#     try:
#         with transaction.atomic():
#             try:
#                 api_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=api_key)
#                 user = token1.user
#                 check_group = user.groups.filter(name='User').exists()
#                 if check_group == False:
#                     return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             except:
#                 print(traceback.format_exc())
#                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             post = Post.objects.get(pk=pk,post_status=1)
#             print(post)
#             if post:
#                 post_serializer = PostSerializer(post)
#                 post_data = post_serializer.data
#                 user = User.objects.get(id=post_data['user'])
#                 post_data['fullname'] = user.fullname
#                 post_data['image'] = user.image
#                 relpostsize = RelPostSize.objects.values('size__size').filter(post_id = post.id)
#                 relpostfabric = RelPostFabric.objects.values('fabric__fabric').filter(post_id=post.id)
#                 print(relpostsize)
#                 temp = []
#                 temp1 =  []
#                 for fabric in relpostfabric:
#                     temp.append(fabric)
#                     post_data['fabric'] = temp
#                 for size in relpostsize:
#                     temp1.append(size)
#                     post_data['size'] = temp1
#                 return Response({"response":post_data},status=status.HTTP_200_OK)
#             else:
#                 return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@AppVersion_required
@csrf_exempt
@api_view(['GET'])
def getPost(request,pk):
    try:
        with transaction.atomic():
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            post = Post.objects.get(pk=pk,post_status=1)
            post_like = PostLike.objects.filter(user_id =user.id,post_id = post.id)
            post_fav = Favourite.objects.filter(user_id = user.id , post_id = post.id)
            cart = Cart.objects.filter(user_id = user.id, post_id = post.id)
            # cartCount = User.objects.filter(id = user.id)
            cart = user.cartNo
            if post:
                post_serializer = PostSerializer(post)
                data = post_serializer.data


                user = User.objects.get(id=data['user'])
                data['fullname'] = user.fullname
                data['image'] = user.image
                data['address'] = user.address
                data['cartCount'] = cart
                relpostsize = RelPostSize.objects.values(size_name=F('size__size'),sizeid = F('size__id')).filter(post_id = post.id)
                # relpostsize = RelPostSize.objects.values(size='size__size',size1='size__id').filter(post_id = post.id)
                # relpostsize = RelPostSize.objects.extra(select={'size_id':'size'}).values('size_id').filter(post_id = post.id)
                relpostfabric = RelPostFabric.objects.values(fabric_name=F('fabric__fabric'),fabricid=F('fabric__id')).filter(post_id = post.id)
                postimages  = PostImage.objects.values('id','post_images').filter(post_id = post.id)
                post_img_colour = PostImage.objects.values(colour_name=F('colour__colour_code'),colourid=F('colour__id')).filter(post_id = post.id)
        #    annotate(s=F('size__id'),s1=F('size__size'))
                if post_like:
                    data['post_like'] = True
                else:
                    data['post_like'] = False
                if post_fav:
                    data['post_fav'] = True
                else:
                    data['post_fav'] = False
                if cart:
                    data['added_to_cart'] = True
                else:
                    data['added_to_cart'] = False

                temp = []
                temp1 =  []
                temp2 = []
                temp3 = []

                for ele in postimages:
                    temp.append(ele)
                    data['post_image'] = temp
                for colour in post_img_colour:
                    temp1.append(colour)
                    data['post_image_colour'] = temp1
                for size in relpostsize:
                    temp2.append(size)
                    data['size'] = temp2
                for fabric in relpostfabric:
                    temp3.append(fabric)
                    data['fabric'] = temp3
                
                return Response({"message":"post get successfully","data":data},status=status.HTTP_200_OK)
            else:
                return Response({"message" : "This post has been disabled by admin", "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "This post has been disabled by admin", "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)





# relpostsize = RelPostSize.objects.annotate(colour=F('size__size')).values('size').filter(post_id = post.id)

# @AppVersion_required
# @csrf_exempt
# @api_view(['GET'])
# def getPost(request,pk):
#     try:
#         with transaction.atomic():
#             try:
#                 api_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=api_key)
#                 user = token1.user
#                 check_group = user.groups.filter(name='User').exists()
#                 if check_group == False:
#                     return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             except:
#                 print(traceback.format_exc())
#                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             post = Post.objects.get(pk=pk,post_status=1)
#             post_like = PostLike.objects.filter(user_id =user.id,post_id = post.id)
#             post_fav = Favourite.objects.filter(user_id = user.id , post_id = post.id)
#             if post:
#                 post_serializer = PostSerializer(post)
#                 post_data = post_serializer.data
#                 user = User.objects.get(id=post_data['user'])
#                 post_data['fullname'] = user.fullname
#                 post_data['image'] = user.image
#                 relpostsize = RelPostSize.objects.values('size__size').filter(post_id = post.id)
#                 post_img_colour = PostImage.objects.values('colour__colour_code','colour__id').filter(post_id = post.id)
#                 relpostfabric = RelPostFabric.objects.values('fabric').filter(post_id = post.id)
#                 postimages  = PostImage.objects.values('post_images').filter(post_id = post.id)
#                 if post_like:
#                     post_data['post_like'] = True
#                 else:
#                     post_data['post_like'] = False
                
#                 if post_fav:
#                     post_data['post_fav'] = True
#                 else:
#                     post_data['post_fav'] = False
#                 temp = []
#                 temp1 =  []
#                 temp2 = []
#                 temp3 = []
#                 for ele in postimages:

#                     temp.append(ele['post_images'])
#                     post_data['post_image'] = temp
#                 for colour in post_img_colour:
#                     temp1.append(colour)
#                     post_data['post_image_colour'] = temp1
#                 for size in relpostsize:
#                     temp2.append(size)
#                     post_data['size'] = temp2
#                 for fabric in relpostfabric:
#                     temp3.append(fabric)
#                     post_data['fabric'] = temp3
#                 return Response({"data":post_data},status=status.HTTP_200_OK)
#             else:
#                 return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#====================================
# Api for delete post
#====================================
@AppVersion_required
@api_view(['POST'])
def deletePost(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            user1 = User.objects.get(id =user.id)
            post = Post.objects.get(id=post_id,post_status =1)
            if post:
                post1 = Post.objects.filter(id = post.id,user_id=user.id).update(post_status=0)
                if post1:
                    post_count = user1.post_count
                    User.objects.filter(id = user.id).update(post_count = post_count-1)
                    return Response({"message" : deletePostSuccessMessage, "status" : "1"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)




#======================================
# Api for like and dislike post
# =====================================
# @csrf_exempt
# @api_view(['POST'])
# def LikedislikePost(request):
#     try:
#         with transaction.atomic():
#             received_json_data = json.loads(request.body, strict=False)
#             try:
#                 api_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=api_key)
#                 user = token1.user
#                 check_group = user.groups.filter(name='User').exists()
#                 if check_group == False:
#                     return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             except:
#                 print(traceback.format_exc())
#                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             post_id = received_json_data['post']
#             like_status = int(received_json_data['like_status'])
#             post= Post.objects.get(id = post_id,post_status = 1)
#             if like_status == 1:
#                 post_like = PostLike.objects.filter(user_id = user.id,post_id = post.id)
#                 if not post_like.exists():
#                     post_like = PostLike.objects.create(user_id = user.id,post_id = post.id)
#                     total_likes = post.total_likes
#                     Post.objects.filter(id = post.id).update(total_likes = total_likes+1)
#                     SendNotification(user.id,)
#                     return Response({"status": "1", 'message': PostLikedMessage},status=status.HTTP_200_OK)
#                 else:
#                     return Response({"message": "Post already liked", "status": "0"},
#                                                 status=status.HTTP_500_INTERNAL_SERVER_ERROR) 
#             elif like_status==0:
#                 post_dislike = PostLike.objects.filter(user_id=user.id,post_id=post.id)
#                 if post_dislike.exists():
#                     post_dislike.delete()
#                     total_likes = post.total_likes
#                     Post.objects.filter(id = post.id).update(total_likes = total_likes-1)
#                     return Response({"status": "1", 'message': PostDislikedMessage},
#                                                 status=status.HTTP_200_OK)
#                 else:
#                     return Response({"message": "Already not liked ", "status": "0"},
#                                             status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#             else:
#                 return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#======================================
# Api for favourite and unfavourite post
# =====================================
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def setFavPost(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            fav_status = int(received_json_data['fav_status'])
            post= Post.objects.get(id = post_id,post_status = 1)
            if fav_status == 1:
                post_fav = Favourite.objects.filter(user_id = user.id,post_id = post.id)
                if not post_fav.exists():
                    post_fav = Favourite.objects.create(user_id = user.id,post_id = post.id)
                    return Response({"status": "1", 'message': setFavouriteMessage},status=status.HTTP_200_OK)
                else:
                    return Response({"message": "already in favourite", "status": "0"},
                                                status=status.HTTP_500_INTERNAL_SERVER_ERROR) 
            elif fav_status==0:
                post_unfav = Favourite.objects.filter(user_id=user.id,post_id=post.id)
                if post_unfav.exists():
                    post_unfav.delete()
                    return Response({"status": "1", 'message': setUnfavouriteMessage},
                                                status=status.HTTP_200_OK)
                else:
                    return Response({"message": "Already not favourite ", "status": "0"},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({"message": "This post has been disabled by admin", "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "This post has been disabled by admin", "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#=============================================
# Api for get list of favourite posts
#=============================================
@AppVersion_required
@api_view(['GET'])
def getFavouritePost(request):  
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            user1 = User.objects.get(id = user.id)
            page_num = request.GET.get('page_num')
            favourite = Favourite.objects.select_related('user', 'post').filter(user_id = user.id)                               
            # paginator = Paginator(favourite,5)
            # try:
                # favourite = paginator.page(page_num)
            # except:
                # favourite = None                   
            if favourite:
                favouriteserializer = FavouriteSerializer(favourite,many=True)
                favouriteserializer_data = favouriteserializer.data
                for data in favouriteserializer_data:
                    obj = User.objects.get(id=data['user'])
                    obj1 = Post.objects.get(id = data['post'])
                    price = obj1.price
                    postimages  = PostImage.objects.values('post_images').filter(post_id = obj1)
                    data['post_description'] = obj1.post_description
                    data['total_likes'] = obj1.total_likes
                    data['total_comments'] = obj1.total_comments
                    data['price'] = str(price)
                    data['fullname'] = obj1.user.fullname
                    data['image'] = obj1.user.image
                    data['user'] = obj1.user.id
                    data['post_fav'] = True
                    data['created_time'] = obj1.created_time
                    data['post_type'] = obj1.post_type
                    temp = []
                    post_like = PostLike.objects.filter(user_id = user.id,post_id = data['post'])
                    if post_like:
                        data['post_like'] = True
                    else:
                        data['post_like'] = False
                    for d in postimages:
                        temp.append(d['post_images'])
                    data['post_image'] = temp
                return Response({"data":favouriteserializer_data}, status=status.HTTP_200_OK)
            else:
                return Response({"data":[]}, status=status.HTTP_200_OK)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)







#======================================
# Api for add post comment
#======================================
@AppVersion_required
@api_view(['POST'])
def addPostComment(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
            post_id = received_json_data['post_id']
            post= Post.objects.get(id = post_id,post_status=1)
            postComment = PostComment.objects.create(post_id = post.id,
                                                user_id = user.id,
                                                comment = received_json_data["comment"],
                                                created_time = nowTime,
                                                status = 1)
            if postComment:
                total_comments = post.total_comments
                Post.objects.filter(id = post.id).update(total_comments = total_comments+1)
                a = Post.objects.get(id = post_id)
                post_comment_detail = {
                    
                    "message":PostCommentMessage,
                    "id": postComment.id,
                    "user":postComment.user.id,
                    "fullname": postComment.user.fullname,
                    "image": postComment.user.image,
                    "post_id": postComment.post_id,
                    "comment": postComment.comment,
                    "created_time": postComment.created_time,
                    "total_comments": a.total_comments,
                    
                }
                # a = (post.user)
                # if a.onoffnotification == 1:
                #     notify = SendNotification(user.id,a.id,"notification",str(a.fullname) + "commented on your post","comment on post notification" ,str(post.id))            
                return Response(post_comment_detail, status=status.HTTP_200_OK)
            else:
                return Response({"message" : "This post has been disabled by admin", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "This post has been disabled by admin", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#===================================
# Api for delete post comment
#====================================
@AppVersion_required
@api_view(['POST'])
def deletePostComment(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            comment_id = received_json_data['comment']
            a = PostComment.objects.get(id = comment_id)
            post = a.post_id
            post = Post.objects.get(id = post)
            postComment = PostComment.objects.filter(id=comment_id,user_id = user.id,status=1).exists()                 
            if postComment:
                PostComment.objects.filter(id = comment_id,user_id = user.id).update(status=0)
                total_comments = post.total_comments
                Post.objects.filter(id = post.id).update(total_comments = total_comments-1)
                return Response({"message" : DeleteCommentMessage, "status" : "1"}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#====================================================
# Api for get list of comments for a particular post
#====================================================
@AppVersion_required
@api_view(['GET'])
def GetPostComment(request,pk):  
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            
            post= Post.objects.get(pk=pk,post_status=1)
            
            user1 = User.objects.get(id = user.id)
            # page_num = request.GET['page_num']
            postComment = PostComment.objects.filter(post_id = post.id,status=1).order_by('-created_time')
           
            # paginator = Paginator(postComment, 10)
            # try:
                # postComment = paginator.page(page_num)
            # except:
                # postComment = None                              
            if postComment:
                postcommentserializer = PostCommentSerializer(postComment,many=True)
                postcommentserializer_data = postcommentserializer.data
                postcommentserializer_data.reverse()
                for data in postcommentserializer_data:
                    obj = User.objects.get(id=data['user'])
                    data['fullname'] = obj.fullname
                    data['image'] = obj.image
                return Response({"message" : "Comments fetched successfully","data":postcommentserializer_data}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : "Comments fetched successfully", "data":[]}, status=status.HTTP_200_OK)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "This post has been disabled by admin", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#=========================================
# Api for send message
#=========================================
@AppVersion_required
@api_view(["POST"])
def sendMessage(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            tempS = datetime.datetime.utcnow().replace(tzinfo=utc)
            
            # nowTime = datetime.datetime.strptime(str(timezone.now().date()) + " " + tempS, '%Y-%m-%d %H:%M:%S')
            
            u = User.objects.get(id=user.id)
            send  = User.objects.get(id = u.id)
            rec = User.objects.get(id = received_json_data["receiver_id"])

            authuser = Message.objects.create(sender_id=u.id,
                                            message = received_json_data["message"],
                                            receiver_id = received_json_data["receiver_id"],
                                            created_time =tempS)


            data = {
            "sender": u.id,
            "receiver": authuser.receiver_id,
            "message": authuser.message,
            "is_read": authuser.is_read,
            "sender_status": authuser.sender_status,
            "receiver_status": authuser.receiver_status,
            "created_time": authuser.created_time,
            "image": u.image,
            }
            if authuser is not None:
                 
                try:
                    Token.objects.get(user_id = received_json_data["receiver_id"]) 
                    if rec.onoffnotification == 1:
                        notify = SendChatNotification(u.id, str(send.fullname), str(send.image), rec.id, str(rec.fullname) , str(rec.image), tempS, received_json_data["message"], str(send.fullname) + " has sent you a message")
                    
                    return Response(data, status=status.HTTP_200_OK)
                except:
                    return Response(data, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
           
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#===========================================
#Api for get message
#===========================================
@AppVersion_required
@api_view(['POST'])
def getMessage(request):  # chat one to one
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            user_id = received_json_data['id']
            u1 = User.objects.get(id=user_id)
            msg= Message.objects.filter(Q(sender_id=user.id) & Q(receiver_id=u1.id) & Q(sender_status= 1) | (Q(sender_id=u1.id) & Q(receiver_id=user.id) & Q(receiver_status= 1))).order_by('created_time')
            authuser =Message.objects.filter(receiver_id=user.id, sender_id=user_id).update(is_read=1)
            msgSerializer = MessageSerializer(msg,many=True)
            msgs = msgSerializer.data  
            if msgs:  
                for data in msgs:
                    obj = User.objects.get(id = data['sender'])
                    obj1  = User.objects.get(id = data['receiver'])
                    data['image'] = obj.image
                    data['image1']  = obj1.image
                return Response({"data":msgs}, status=status.HTTP_200_OK)    
            else:
                return Response({"data":[], "message": "no data"}, status=status.HTTP_200_OK)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#===============================================
#Api for get chat history
#===============================================
@AppVersion_required
@api_view(['GET'])
def chatHistory(request): # get latest messages
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            
            page_num = int(request.GET['page_num'])

            maxRecords = 20
            cursor = connection.cursor()            
            # condition = "select * from message where((sender_id =" +str(user.id) + " and sender_status = 1) or (receiver_id = " +str(user.id) + " and receiver_status = 1)) and id in (select max(id) from message group by if(sender_id = " + str(user.id) + ", concat(sender_id,'',receiver_id), concat(receiver_id,'',sender_id)))order by created_time desc"
            condition = "select *,date_format(created_time, '%Y-%m-%dT%T.000Z') as created_time from message  where((sender_id =" +str(user.id) + " and sender_status = 1) or (receiver_id = " +str(user.id) + " and receiver_status = 1)) and id in (select max(id) from message group by if(sender_id = " + str(user.id) + ", concat(sender_id,'',receiver_id), concat(receiver_id,'',sender_id)))order by created_time desc"
            paginationCondition = " LIMIT "+ str((page_num - 1) * maxRecords) + "," + str(maxRecords) + " "
            cursor.execute (condition + paginationCondition)
            d = dictfetchall(cursor)
            print("d", d)
            cursor1 = connection.cursor()
            cursor1.execute(condition)
            
            d1 = dictfetchall(cursor1)
            totalRecords= len(d1)

            
            cursor.close()
            totalPage = (totalRecords + maxRecords - 1) / maxRecords;

            print(int(totalPage))
            if d:
                for data in d:
                    obj = User.objects.get(id = data['sender_id'])
                    obj1 = User.objects.get(id = data['receiver_id'])
                    data['sender_image'] = obj.image
                    data['receiver_image'] = obj1.image
                    data['sender_name'] = obj.fullname
                    data['receiver_name'] = obj1.fullname
                    if obj.id == user.id:
                        data['is_sent_by_me'] = True
                    else:
                        data['is_sent_by_me'] = False
                    
                    
                return Response({"data":d ,"cart_count":user.cartNo, "total_pages": int(totalPage)}, status=status.HTTP_200_OK)
            else:
                return Response({"data":[],"cart_count":user.cartNo, "message": "no data"}, status=status.HTTP_200_OK)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=========================================
#Api for delete message
#=========================================
@AppVersion_required
@api_view(["POST"])
def deleteMessage(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkUser = user.groups.filter(name='User').exists()
                except:
                    return Response({'message' : "Session expired! Please login again", "status":"0"}, status=status.HTTP_401_UNAUTHORIZED)
                if checkUser is not None:
                    receiver_id = request.data["receiver_id"]
                    u = User.objects.get(id=user.id)


                    page_num = int(request.data['page_num'])
                    maxRecords = 20
                    cursor3 = connection.cursor()            
                    condition = "select *,date_format(created_time, '%Y-%m-%dT%T.000Z') as created_time from message  where((sender_id =" +str(user.id) + " and sender_status = 1) or (receiver_id = " +str(user.id) + " and receiver_status = 1)) and id in (select max(id) from message group by if(sender_id = " + str(user.id) + ", concat(sender_id,'',receiver_id), concat(receiver_id,'',sender_id)))order by created_time desc"
                    paginationCondition = " LIMIT "+ str(((page_num - 1) * maxRecords)+19) + "," + str(1) + " "
                    cursor3.execute (condition + paginationCondition)
                    d = dictfetchall(cursor3)
                    cursor3.close()
                    if d== []:
                       last_ele=""
                    for i in d:
                        last_ele=i['id']

                    
                    
                    cursor = connection.cursor()
                    cursor.execute("update message SET sender_status = False where (sender_id=" + str(u.id) + " and receiver_id=" + str(receiver_id) + ")")
                   
                    cursor.execute("update message SET receiver_status = False where (receiver_id = " + str(u.id) + " and sender_id = " + str(receiver_id) + ")")
                    cursor.close()
                    
                    
                        
                    cursor2 = connection.cursor()            
                    condition = "select *,date_format(created_time, '%Y-%m-%dT%T.000Z') as created_time from message  where((sender_id =" +str(user.id) + " and sender_status = 1) or (receiver_id = " +str(user.id) + " and receiver_status = 1)) and id in (select max(id) from message group by if(sender_id = " + str(user.id) + ", concat(sender_id,'',receiver_id), concat(receiver_id,'',sender_id)))order by created_time desc"
                    paginationCondition = " LIMIT "+ str(((page_num - 1) * maxRecords)+19) + "," + str(1) + " "
                    cursor2.execute (condition + paginationCondition)
                    d = dictfetchall(cursor2)
                
                    cursor1 = connection.cursor()
                    cursor1.execute(condition)
                    
                    d1 = dictfetchall(cursor1)
                    totalRecords= len(d1)

                    
                    cursor2.close()
                    totalPage = (totalRecords + maxRecords - 1) / maxRecords;

                
                    if d:
                        for data in d:
                            obj = User.objects.get(id = data['sender_id'])
                            obj1 = User.objects.get(id = data['receiver_id'])
                            data['sender_image'] = obj.image
                            data['receiver_image'] = obj1.image
                            data['sender_name'] = obj.fullname
                            data['receiver_name'] = obj1.fullname
                            if obj.id == user.id:
                                data['is_sent_by_me'] = True
                            else:
                                data['is_sent_by_me'] = False

                    if last_ele=="":
                       return Response({"message": "delete successfully", "status":"1","data":d ,"cart_count":user.cartNo,"total_pages": int(totalPage)}, status=status.HTTP_200_OK)
                    else:
                        return Response({"message": "delete successfully", "status":"1","data":d ,"cart_count":user.cartNo,"deleted_message":last_ele, "total_pages": int(totalPage)}, status=status.HTTP_200_OK)
                
                else:
                    return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)

    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#=======================================
#Api for report post by user
#=======================================
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def report_post(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            post1 = Post.objects.get(id = post_id,post_status=1)
            report1 = ReportPost.objects.filter(user_id = user.id, post_id = post1)
            if report1:
                return Response({"message":"You have already reported for this post","status":"1"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                if received_json_data['reason'] == "Unauthorized Sales":
                    report = ReportPost.objects.create(user_id = user.id,
                                                        post_id = post1.id,
                                                        reason = "Unauthorized Sales",
                                                        status = 1)
                elif received_json_data['reason'] == "Inappropriate content":
                    report = ReportPost.objects.create(user_id = user.id,
                                                        post_id = post1.id,
                                                        reason = "Inappropriate content",
                                                        status = 1)
                elif received_json_data['reason'] == "Threatening or violent":
                    report = ReportPost.objects.create(user_id = user.id,
                                                        post_id = post1.id,
                                                        reason = "Threatening or violent",
                                                        status = 1)
                else:
                    report = ReportPost.objects.create(user_id = user.id,
                                                        post_id = post1.id,
                                                        reason = received_json_data['reason'],
                                                        status = 1)
                return Response({"message":"successfully reported","status":"1"},status=status.HTTP_200_OK)
                
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "This post has been disabled by admin", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
# #==============================================
# # get user profile
# #==============================================

# @AppVersion_required
# @csrf_exempt
# @api_view(['GET'])
# def Myprofile(request):
#     try:
#         with transaction.atomic():
#             # received_json_data = json.loads(request.body, strict=False)
#             try:
#                 api_key = request.META.get('HTTP_AUTHORIZATION')
#                 token1 = Token.objects.get(key=api_key)
#                 user = token1.user
#                 check_group = user.groups.filter(name='User').exists()
#                 if check_group == False:
#                     return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             except:
#                 print(traceback.format_exc())
#                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
#             serializer = UserSerializer(user).data
#             posts = Post.objects.filter(user_id=user.id,post_status=1)
#             post1 = PostImage.objects.values('post_images').filter(post_id__in = posts)
#             temp = []
#             for p in post1:
#                 temp.append(p['post_images'])
#             serializer['post_image'] = temp
#             return Response({"response":serializer},status=status.HTTP_200_OK)
#     except Exception:
#         print(traceback.format_exc())
#         return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#==============================================
# Get user profile
#==============================================



#@AppVersion_required
@csrf_exempt
@api_view(['GET'])
def Userprofile(request,pk):
    try:
        with transaction.atomic():
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            user1 = User.objects.get(pk=pk)
          
            serializer = UserSerializer(user1).data
            follow = FollowUser.objects.filter(follow_by_id = user.id, follow_to_id = user1.id)
            
            posts = Post.objects.filter(user_id=user.id,post_status=1)
            
            # post1 = PostImage.objects.values('post','post_images').filter(post_id__in = posts).annotate(Count('post'), Count('post_image')).order_by('created_time')

            cursor = connection.cursor()
            cursor.execute("select post_id as post,post_images as post_image from postimage pi inner join post p on p.id = pi.post_id and p.user_id=" + str(user1.id) + "  and post_status = 1  group by p.id order by p.created_time desc ")
            d = dictfetchall(cursor)
            cursor.close()
            temp = []
            temp1 = []
            for p in d:
                temp.append(p)
                serializer['post_images']= temp
            
            if follow:
                temp1.append(follow)
                serializer["follow_status"] = True
            else:
                serializer["follow_status"] = False
                serializer['user_id'] = user.id
            return Response({"data":serializer },status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#============================================================
# Search user by username or fullname
#===========================================================


def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def searchUser(request):
    try:
        with transaction.atomic():
            try:
                received_json_data = json.loads(request.body, strict=False)
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            page_num = int(request.GET['page_num'])

            maxRecords = 20
            searchText = received_json_data['searchText']
            searchText = searchText.replace("_", "\_")
            print(searchText)
            if searchText:  
                cursor = connection.cursor()
                condition = "select id,fullname, user_name, image from auth_user where (id != " +str(user.id) + ") and (is_pro_created = True) and (fullname like '%" + str(searchText) + "%' or user_name like '%" + str(searchText) + "%') and id in (select user_id as id from auth_user_groups where group_id != 2)" 
                paginationCondition = " LIMIT "+ str((page_num - 1) * maxRecords) + "," + str(maxRecords) + " "
                cursor.execute (condition + paginationCondition)
               
                d = dictfetchall(cursor)
                cursor.close()
                cursor1 = connection.cursor()
                cursor1.execute(condition)
                
                
                d1 = dictfetchall(cursor1)
                totalRecords= len(d1)
                
                cursor.close()
                
                totalPage = (totalRecords + maxRecords - 1) / maxRecords;
                return Response({"status": "1", 'message': 'Get successfully','data':d, "total_pages": int(totalPage)},status=status.HTTP_200_OK)
            
            else:
               # maxRecords = 10
                cursor = connection.cursor()
                condition = "select id,fullname, user_name, image from auth_user where (id != " +str(user.id) + ") and (is_pro_created = True) and id in (select user_id as id from auth_user_groups where group_id != 2) order by fullname asc"
                paginationCondition = " LIMIT "+ str((page_num - 1) * maxRecords) + "," + str(maxRecords) + " "
                print("max", maxRecords)
                cursor.execute (condition + paginationCondition)
                d = dictfetchall(cursor)
                print("length", len(d))
                cursor.close()
                cursor1 = connection.cursor()
                cursor1.execute(condition)

                d1 = dictfetchall(cursor1)
                totalRecords= len(d1)
                print("total", totalRecords)
                cursor.close()
                totalPage = (totalRecords + maxRecords - 1) / maxRecords;
                return Response({'message': 'Get successfully', 'data':d, "total_pages": int(totalPage)},status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#========================================================
#Set  User Folllower and following
# ======================================================= 
@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def setFollow(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            follow_to_id = received_json_data['follow_to']
            user1 = User.objects.get(id=follow_to_id)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
            follow_status = int(received_json_data['follow_status'])
            if follow_status == 1:
                follow = FollowUser.objects.filter(follow_by_id= user.id,follow_to_id = user1.id)
                if not follow.exists():
                    follow = FollowUser.objects.create(follow_by_id = user.id,follow_to_id = user1.id)
                    
                    total_follower = user1.total_follower
                    User.objects.filter(id = user1.id).update(total_follower = total_follower+1)
                    total_following = user.total_following
                    User.objects.filter(id = user.id).update(total_following = total_following+1)
                    
                    if user1.onoffnotification == 1:

                        notobj = Notification.objects.create(id = uuid.uuid1(),
                                                          receiver_id = follow_to_id,
                                                          sender_id = user.id,
                                                          message = "has followed you",
                                                          tag = "follow",
                                                          notification_time = nowTime,
                                                          table_id = follow.id)
                        try:
                            Token.objects.get(user_id=follow_to_id)
                            notificationObj = SendSetFollowNotification(receiverId=follow_to_id,senderId=user.id,title="notification",message= str(user.fullname) + "has followed you",tag = "follow",table_id = follow.id)
                                               

                            return Response({"status": "1", 'message': "set User Following"},status=status.HTTP_200_OK)
                        except:
                            return Response({"status": "1", 'message': "set User Following"},status=status.HTTP_200_OK)

                             
                else:
                    return Response({"message": "already in following list", "status": "0"},
                                                status=status.HTTP_500_INTERNAL_SERVER_ERROR) 
            elif follow_status == 0:
                follow = FollowUser.objects.filter(follow_by_id= user.id,follow_to_id = user1.id)
                if follow.exists():
                    follow.delete()
                    total_follower = user1.total_follower
                    User.objects.filter(id = user1.id).update(total_follower = total_follower-1)
                    total_following = user.total_following
                    User.objects.filter(id = user.id).update(total_following = total_following-1)

                    return Response({"status": "1", 'message': "unfollowed sucessfully"},status=status.HTTP_200_OK)
                else:
                    return Response({"message": "Already not in followlist ", "status": "0"},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=========================================================
# Get user followers
#=========================================================

@AppVersion_required
@api_view(['POST'])
def getFollowers(request):  
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            # page_num = request.GET['page_num']

            user_id = received_json_data['user_id']
            
            follower = FollowUser.objects.select_related('follow_by').filter(follow_to_id = user_id) 
                            
            
            # paginator = Paginator(follower, 4)
            # try:
            #     follower = paginator.page(page_num)
            # except:
            #     follower = None  

            
            if follower:
                followserializer = FollowUserSerializer(follower,many=True)
                followserializer_data = followserializer.data
                
                for data in followserializer_data:
                    obj = User.objects.get(id=data['follow_by'])
                    data['fullname'] = obj.fullname
                    data['image'] = obj.image
                    data['user_name'] = obj.user_name
                    
                
                    following = FollowUser.objects.filter(follow_by_id = user.id, follow_to_id =data['follow_by'])

                    if following:
                        data["follow_status"] = True
                    else:
                        data["follow_status"] = False


                return Response({"data":followserializer_data}, status=status.HTTP_200_OK)

            else:
                return Response({"data" : []}, status=status.HTTP_200_OK)      
    
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#====================================================================
#Get user Following
#====================================================================
@AppVersion_required
@api_view(['POST'])
def getFollowing(request):  
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            # page_num = request.GET['page_num']
            user_id = received_json_data['user_id']

            follower = FollowUser.objects.select_related('follow_to').filter(follow_by_id = user_id)     

            # paginator = Paginator(follower, 4)
            # try:
            #     follower = paginator.page(page_num)
            # except:
            #     follower = None    
            temp=[]                    
            if follower:
                followserializer = FollowUserSerializer(follower,many=True)
                followserializer_data = followserializer.data
                for data in followserializer_data:
                    obj = User.objects.get(id=data['follow_to'])
                    data['fullname'] = obj.fullname
                    data['image'] = obj.image
                    data['user_name'] = obj.user_name

               
                    following = FollowUser.objects.filter(follow_by_id = user.id, follow_to_id =data['follow_to'])
                    
                    if following:
                        temp.append(following)
                        data["follow_status"] = True
                    else:
                        data["follow_status"] = False

                return Response({"data":followserializer_data}, status=status.HTTP_200_OK)
            else:
                return Response({"data" : []}, status=status.HTTP_200_OK)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#======================================================
#get User home page
#======================================================



#@AppVersion_required
@api_view(['GET'])
def getHomePage(request):
    bnk_detail = {}
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            # followed_people = FollowUser.objects.filter(follow_to_id = user.id).values('follow_by')
            # following_people = FollowUser.objects.filter(follow_by_id = user.id).values('follow_to')
            # a = Post.objects.filter(Q(user__in=followed_people) or Q(user__in=following_people)).order_by('-created_time')
            try:
                bnkdetail = BankDetail.objects.filter(user_id=user.id)
                print(bnkdetail)
                if len(bnkdetail) >0:
                    detailserializer = BankDetailSerializer(bnkdetail,many=True)
                    bnk_detail = detailserializer.data[0]
            except:
                bnk_detail = {}
            page_num = request.GET['page_num']
            
            post = Post.objects.filter(post_status=1).exclude(user_id = user.id).order_by('-created_time')
            paginator = Paginator(post, 20)
            try:
                post = paginator.page(page_num)
            except:
                post = None
            if post is not None:
                post_data = PostSerializer(post,many=True).data
                for data in post_data:
                    post_like = PostLike.objects.filter(user_id = user.id,post_id = data['id'])
                    if post_like:
                        data['post_like'] = True
                    else:
                        data['post_like'] = False
                    post_fav = Favourite.objects.filter(user_id = user.id , post_id = data['id'])
                    obj = User.objects.get(id=data['user'])
                    # data['cart_count'] = obj.cartNo
                    print(post_fav)
                    if post_fav:
                        data['post_fav'] = True
                    else:
                        data['post_fav'] = False
                   
                    
                    postimages = PostImage.objects.values('post_images').filter(post_id = data['id'])
                    temp=[]  
                    for i in postimages:
                        temp.append(i['post_images'])

                    data['post_image'] = temp
                    data['fullname'] = obj.fullname
                    data['image'] = obj.image
                obj2= User.objects.get(id=user.id)
                
                return Response({"message" :"success",'has_next': post.has_next(),"data":post_data,"cart_count":obj2.cartNo, "login_type":user.login_type,"bank_detail":bnk_detail}, status=status.HTTP_200_OK)
            else:
                return Response({"data": []}, status=status.HTTP_200_OK)

    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#================================================
# Set user On Off notification
#=================================================
@AppVersion_required
@api_view(['POST'])
def SetOnOffNotification(request):
    try:
        with transaction.atomic():
            try:
                received_json_data = json.loads(request.body, strict=False)
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            user = User.objects.get(id=user.id)
            onoffnotification = received_json_data['notificationStatus']
            notificationUpdate = User.objects.filter(id=user.id).update(onoffnotification=onoffnotification)
            if notificationUpdate:
                if int(onoffnotification):
                    return Response({"message": "Notification successfully on", "status": "1",
                                             "notificationStatus": int(onoffnotification)}, status=status.HTTP_200_OK)
                else:
                    return Response({"message": "Notification successfully off", "status": "1",
                                             "notificationStatus": int(onoffnotification)}, status=status.HTTP_200_OK)
            else:
                return Response({"message": errorMessage, "status": "0"},
                                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)




#=======================================================
#method to send notificationi like dislike
#======================================================
def SendNotification(senderId, receiverId,title,message,tag,table_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiverId)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = message
        if idsArray_ios.__len__() > 0:
            
            data_message = {
                "message_title": title,
                "message_body": message,
                "post_id":table_id,
                "tag":tag,
           }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound ="default",message_body=message_body, data_message=data_message)
#            if result is not None:
 #               return True
   #             print("**********")
  #          else:
    #            return False
     #           print("###########")
            #else:
             #   return False
    except Exception as e:
        return False

#===================================
# send notification order place
#===================================

def SendOrderNotification(senderId, receiverId,title,message,tag,order_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiverId)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = message
        if idsArray_ios.__len__() > 0:

            data_message = {
                "message_title": title,
                "message_body": message,
                "order_id":order_id,
                "tag":tag,
        #        "order_id":order_id,

           }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound="default",message_body=message_body, data_message=data_message)
                #return True
                #print("**********")
#            else:
 #               return False
               # print("###########")
            #else:
             #   return False
    except Exception as e:
        return False


#=======================================
# send notidfication for chat
#=========================================

def SendChatNotification(sender_id,sender_name,sender_image,receiver_id,receiver_fullname,receiver_image,created_time,message,title):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        print(receiver_id,"iid")
        receiver = User.objects.get(id=receiver_id)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message = message.encode("latin_1")
        print(message)
        message_body = (message.decode("raw_unicode_escape").encode('utf-16', 'surrogatepass').decode('utf-16'))
        print(message_body)
        if idsArray_ios.__len__() > 0:

            data_message = {
                "message_title": title,
                "message_body": message_body,
                "sender_id": sender_id,
		"sender_name": sender_name,
                "receiver_id": receiver_id,
                "receiver_name": receiver_fullname,
                "tag":"message",
            }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound="default",message_body=message_body, data_message=data_message)

            if result is not None:
                return True
            else:
                return False

    except Exception as e:
        return False


#=============================================
# method for accept notification
#=============================================

def SendAcceptOrderNotification(order_id,title,tag,sender_id,receiver_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiver_id)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = title
        if idsArray_ios.__len__() > 0:

            data_message = {
                "message_title": title,
                "message_body": "Accepted your Order",
                "sender_id": sender_id,
                "receiver_id": receiver_id,
                "tag":tag,
                "order_id":order_id
            }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound="default",message_body="Accepted your Order", data_message=data_message)

            if result is not None:
                return True
            else:
                return False

    except Exception as e:
        return False



#==================================
#likedislike
#=================================

@AppVersion_required
@csrf_exempt
@api_view(['POST'])
def LikedislikePost(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            like_status = int(received_json_data['like_status'])
            post= Post.objects.get(id = post_id,post_status = 1)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
            if like_status == 1:
                post_like = PostLike.objects.filter(user_id = user.id,post_id = post.id)
                if not post_like.exists():
                    post_like = PostLike.objects.create(user_id = user.id,post_id = post.id)
                    total_likes = post.total_likes
                    Post.objects.filter(id = post.id).update(total_likes = total_likes+1)
                    a = post.user
                    if user.id !=post.user_id:
                        if a.onoffnotification == 1:
                            noti = Notification.objects.create(id = uuid.uuid1(),
                                    receiver_id = post.user_id, 
                                    sender_id = user.id,
                                    message = "liked your post",
                                    tag = "like" ,
                                    notification_time = nowTime,
                                    table_id = post.id)
                            try:
                                Token.objects.get(user_id=post.user_id)
                            
                                notify = SendNotification(user.id,post.user_id,"notification", str(user.fullname) + " liked your post","like" ,str(post.id))   
                                
                                    
                                return Response({'message': PostLikedMessage},status=status.HTTP_200_OK)
                            except:
                                return Response({'message': PostLikedMessage},status=status.HTTP_200_OK)
                    else:
                       print("nononononono")
                    return Response({'message': PostLikedMessage},status=status.HTTP_200_OK)   
                else:
                    return Response({"message": "Post already liked"},
                                                status=status.HTTP_500_INTERNAL_SERVER_ERROR) 
            elif like_status==0:
                post_dislike = PostLike.objects.filter(user_id=user.id,post_id=post.id)
                if post_dislike.exists():
                    post_dislike.delete()
                    total_likes = post.total_likes
                    Post.objects.filter(id = post.id).update(total_likes = total_likes-1)
                    return Response({"status": "1", 'message': PostDislikedMessage},
                                                status=status.HTTP_200_OK)
                else:
                    return Response({"message": "Already not liked "},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({"message": "This post has been disabled by admin"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        
        print(traceback.format_exc())
        
        return Response({"message" : "This post has been disabled by admin"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#================================================
# Add post into cart
#================================================
@AppVersion_required
@api_view(['POST'])
def AddToCart(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                check_group = user.groups.filter(name='User').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            post_images = received_json_data['image_id']
            size_id = received_json_data['size_id']
            try:
                post = Post.objects.get(id=post_id,post_status=1)
                post_image = PostImage.objects.get(post =post.id, id = post_images)
                sizes = Size.objects.get(id=size_id)
                cart = Cart.objects.filter(post_id=post, user_id= user.id, size_id = sizes, post_images_id = post_image)
                c = User.objects.get(id = user.id)
                if not cart.exists():
                    a = Cart.objects.create(
                                    size_id = sizes.id,
                                    user_id=user.id,
                                    post_id=post.id,
                                    post_images_id = post_image.id,
                                    price = post.price,)
                    if a:
                        cartNo = user.cartNo
                        User.objects.filter(id = user.id).update(cartNo = cartNo+1)
                        b = User.objects.get(id = user.id)
            
                    else:
                        pass
                    return Response({"message": addCartSuccessMessage, "status": "1", "cartCount": b.cartNo}, status=status.HTTP_200_OK)
                else:
                    return Response({"message": "Item is already in your cart","cartCount": c.cartNo},status=status.HTTP_200_OK) 
            except:
                return Response({"message" : "This post has been disabled by admin"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    except Exception:    
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
#==============================================
# Get posts from cart
#==============================================
@AppVersion_required
@api_view(['GET'])
def ShowCartPosts(request):
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
           
            
            service_tax = 10.00
            cart1 = Cart.objects.filter(user = user.id).order_by('-created_time') 
            if cart1:
                cart1serializer = CartSerializer(cart1,many=True)
                cart_data = cart1serializer.data
                for data in cart_data:
                    post = Post.objects.get(id = data['post'])
                    colour = Colour.objects.get(id = data['colour'])
                    price = post.price
                    obj1 = Size.objects.get(id = data['size'])
                    obj2 = PostImage.objects.get(id = data['post_images'])
                    data['post_image'] = obj2.post_images
                    data['colour_name'] = colour.colour
                    data['post_description'] = post.post_description
                    data['price'] = str(price)
                    data['design_by'] = post.user.fullname
                    data['size_name'] = obj1.size

                

                if cart_data:
                    last_ad = OrderTrn.objects.filter(user_id = user.id).order_by('-transaction_time').first()
                    if last_ad:
                        add1 = Addresses.objects.filter(id = last_ad.address.id,status=1)
                        if add1:
                            add = Addresses.objects.filter(id = last_ad.address.id,status=1).values("id","first_name","last_name","phone","city","postal_code","address") 
                            if add:
                                is_default = True
                            else:
                                is_default = False

                            return Response({"message" : "Items fetched successfully","data":cart_data,"address_name":add[0], "default_address":is_default,"serviceCharge":service_tax}, status=status.HTTP_200_OK) 
                        else:
                            return Response({"message" : "Items fetched successfully","data":cart_data, "address_name":{}, "default_address":False,"serviceCharge":service_tax}, status=status.HTTP_200_OK) 
                    else:
                            return Response({"message" : "Items fetched successfully","data":cart_data, "address_name":{}, "default_address":False,"serviceCharge":service_tax}, status=status.HTTP_200_OK) 
            else:
                return Response({"data": [], "address_name":{}, "default_address":False,"serviceCharge":0.00}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=============================================================
# Delete post from cart
#=============================================================
@AppVersion_required
@api_view(['POST'])
def DeletePostFromCart(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status":jsonCards},status=status.HTTP_401_UNAUTHORIZED)
            cart_id = request.data['cart_id']
            cart = Cart.objects.get(id=cart_id,user_id = user.id)
            if cart:
                cart = Cart.objects.filter(id=cart.id).delete()
                cartNo = user.cartNo
                User.objects.filter(id = user.id).update(cartNo = cartNo-1)
                return Response({"message": deleteSuccessMessage},status=status.HTTP_200_OK) 
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#======================================
#Add Card
#======================================
@AppVersion_required
@api_view(['POST'])
def AddCard(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                checkGroup = user.groups.filter(name='User').exists()

                if checkGroup:
                    stripe.api_key = settings.STRIPE_SECRET_KEY
                    cardNumber = request.data['cardNumber']
                    expMonth = request.data['expMonth']
                    expYear = request.data['expYear']
                    cvc = request.data["cvc"]
                    name = request.data["name"]
                    if user.stripe_id == "":
                        try:
                            tokenDetails = stripe.Token.create(
                                card={
                                    "number": cardNumber,
                                    "exp_month": expMonth,
                                    "exp_year": expYear,
                                    "cvc": cvc,
                                    "name": name,
                                },
                            )
                            token_id = tokenDetails.id
                            response = stripe.Customer.create(
                                description = "Customer_" +str(user.id),
                                email = str(user.email))
                            StripeId = response.id
                            
                            User.objects.filter(id=user.id).update(stripe_id = StripeId)
                            u1 = User.objects.get(id = user.id)
                            
                            cardDetails = stripe.Customer.create_source(u1.stripe_id,source=token_id)
                            
                            cardJson = json.loads(str(cardDetails))
                            if cardJson['brand'] ==  "MasterCard":
                                cardJson['card_image'] = '/static/images/ic_master.png'
                            elif cardJson['brand'] == "Visa":
                                cardJson['card_image'] = '/static/images/ic_visa.png'
                            elif cardJson['brand'] == "Diners Club":
                                cardJson['card_image'] = '/static/images/Diners-Club.png'
                            elif cardJson['brand'] == "Discover":
                                cardJson['card_image'] = '/static/images/discover.png'
                            elif cardJson['brand'] == "American Express":
                                cardJson['card_image'] = '/static/images/american_express.png'
                            else:
                                cardJson['card_image'] = '/static/images/jbc.png'
                            cardJson['message'] = addSuccessMessage
                            return Response(cardJson,status=status.HTTP_200_OK)

                        except Exception as e2:
                            message2 = str(e2)
                            return Response({"message":message2.split(":")[1] , "status": "0"},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        try:
                            tokenDetails = stripe.Token.create(
                                card={
                                    "number": cardNumber,
                                    "exp_month": expMonth,
                                    "exp_year": expYear,
                                    "cvc": cvc,
                                    "name": name,
                                },
                            )
                            token_id = tokenDetails.id
                            cardDetails = stripe.Customer.create_source(user.stripe_id,source=token_id)
                            cardJson = json.loads(str(cardDetails))
            
                            
                            
                            if cardJson['brand'] ==  "MasterCard":
                                cardJson['card_image'] = '/static/images/american_express.png'
                            elif cardJson['brand'] == "Visa":
                                cardJson['card_image'] = '/static/images/ic_visa.png'
                            elif cardJson['brand'] == "Diners Club":
                                cardJson['card_image'] = '/static/images/Diners-Club.png'
                            elif cardJson['brand'] == "Discover":
                                cardJson['card_image'] = '/static/images/discover.png'
                            elif cardJson['brand'] == "American Express":
                                cardJson['card_image'] = '/static/images/american_express.png'
                            else:
                                cardJson['card_image'] = '/static/images/jbc.png'
                            cardJson['message'] = addSuccessMessage
                            return Response(cardJson,status=status.HTTP_200_OK)
                        except Exception as e2:
                            message2 = str(e2)
                            return Response({"message":message2.split(":")[1] , "status": "0"},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                        
                        
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@AppVersion_required
@api_view(['GET'])
def Get_List_Cards(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try: 
                    token = Token.objects.get(key=API_key)
                    user = token.user
          
                    check_group = user.groups.filter(name='User').exists

                except:
                    return Response({'message' : "Session expired! Please login again","status":"0"},status=status.HTTP_401_UNAUTHORIZED)
                

                if check_group:
                    stripe.api_key = settings.STRIPE_SECRET_KEY

                    if user.stripe_id: 
                        try:
                            list = stripe.Customer.retrieve(user.stripe_id).sources.list(limit=4,
                                                                                                object='card')
                         
                            cust_json = json.loads(str(list))
                          
                            jsonCards = cust_json['data']
                            for key in jsonCards:
                                if key['brand'] ==  "MasterCard":
                                    key['card_image'] = '/static/images/american_express.png'
                                elif key['brand'] == "Visa":
                                    key['card_image'] = '/static/images/ic_visa.png'
                                elif key['brand'] == "Diners Club":
                                    key['card_image'] = '/static/images/Diners-Club.png'
                                elif key['brand'] == "Discover":
                                    key['card_image'] = '/static/images/discover.png'
                                elif key['brand'] == "American Express":
                                    key['card_image'] = '/static/images/american_express.png'
                                else:
                                    key['card_image'] = '/static/images/jbc.png'
                            return Response({'message':'card list is here', 'cards' : jsonCards}, status=status.HTTP_200_OK)
                        except stripe.error.CardError as e:
                            return Response({"message": str(e), 'cards' : []}, status = status.HTTP_200_OK)
                    else:
                        return Response({"message": "Sorry you have no cards."}, status = status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@AppVersion_required
@api_view(['POST'])
def DeleteCard(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message": "Session expired!! please login again"},status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    Obj = User.objects.get(id=user.id)
                    stripe.api_key = settings.STRIPE_SECRET_KEY
                    cardId = request.data["card_id"]

                    if Obj.stripe_id != "":
                        try:
                            user1 = stripe.Customer.retrieve(Obj.stripe_id)
                            deleted = user1.sources.retrieve(cardId).delete()
                            return Response({'message': "Deleted successfully"},status=status.HTTP_200_OK)
                        except Exception as e:
                            return Response({"message": str(e)},
                                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    else:
                        return Response(
                            {'message': 'User has no cards yet or no stripe id attached.'},status=status.HTTP_500_INTERNAL_SERVER_ERROR)

                else:
                    return Response({"message": errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage}, status=status.HTTP_401_UNAUTHORIZED)

    except Exception as e1:
        print(traceback.format_exc())
        return Response({"message": str(e1)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#==========================================================
#Payment and Order Creation
#==========================================================
from decimal import *
@AppVersion_required
@api_view(['POST'])
def OrderCreate(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try: 
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    print("user", user.id)
                except:
                    return Response({'message' : "Session expired! Please login again","status":"0"},status=status.HTTP_401_UNAUTHORIZED)
                stripe.api_key = settings.STRIPE_SECRET_KEY
                li = []
                card = request.data['card']
                am = request.data['amt']
                nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
                
                charge = stripe.Charge.create(
                    amount= int(am)*100,
                    currency='usd',
                    source=card,
                    customer= user.stripe_id
                )
                address_id = request.data['address_id']
                aa = Addresses.objects.get(user=user.id, id=address_id)

                customer_json = json.loads(str(charge))
                if customer_json['status'] == "succeeded":
                    TransactionId = customer_json['id']
                    order = OrderTrn.objects.create(total_amount = am,
                                        transaction_id = TransactionId,
                                        order_status = "PLACED",
                                        address_id = aa.id,
                                        user_id = user.id)

                    if order:
                        cartobjs = Cart.objects.filter(user_id=user.id)
                        if cartobjs:
                            for data in cartobjs:
                                ordpost = OrderPost.objects.create(
                                                                post_id = data.post_id,
                                                                size = data.size,
                                                                price = data.price,
                                                                order_status = ORDER_STATUS_PENDING,
                                                                post_images_id = data.post_images.id,
                                                                order_id = order.id,
                                                                user_id = user.id)
                                
                                obj1 = Post.objects.get(id = ordpost.post_id)###post object
                                obj2 = obj1.user_id ####seller id
                                li.append(obj2)
                          
                            lii = list(dict.fromkeys(li))
                            print(li)
                            for e in lii:
                                obj3 = User.objects.get(id = e)#########user object

                                obj4 = obj3.onoffnotification

                                if obj3.onoffnotification == 1:
                                    notificationObj = Notification.objects.create(id=uuid.uuid1(),
                                                            receiver_id=e,
                                                            notification_time = nowTime,
                                                            sender_id=user.id,
                                                            message= " has placed an order",
                                                            tag = "order place",
                                                            table_id = obj1.id,
                                                            order_id = ordpost.id)
                                    recv_status = Token.objects.filter(user_id=e).exists()
                                    if recv_status == True:
                                        nott = SendOrderNotification(user.id,e,"notification", str(user.fullname) + " has placed an order", "Order place" , str(ordpost.id))
                                    else:
                                       pass
                                cart = Cart.objects.filter(user_id=user.id).delete()
                                User.objects.filter(id = user.id).update(cartNo = 0)
                        else:
                            print("empty cart")
                            pass

                        Details={"paymentFrom":card,
                                        "amountpaid": am,
                                        "transaction_id": order.transaction_id,
                                        "transaction_time":order.transaction_time,
                                        "order_id": order.id,
                                        "transactionstatus":1,
                                        }

                        
                        return Response({'message':'Payment Successfull, Order has been created', 'payment': Details}, status=status.HTTP_200_OK)
                else:
                    return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED) 
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



        #   posts = Post.objects.filter(user_id=user.id,post_status=1)
#             post1 = PostImage.objects.values('post_images').filter(post_id__in = posts)


#==================================================
# follow send notification
#==================================================

def SendSetFollowNotification(senderId, receiverId,title,message,tag,table_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiverId)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = message
        if idsArray_ios.__len__() > 0:
            data_message = {
                    "message_title" :title,
                    "message_body" : message,
                    "post_id":table_id,
                    "tag":tag,
                    "sender_id":senderId,
                    "receiver_id":receiverId
                    }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound ="default",message_body=message_body, data_message=data_message)
            if result is not None:
                return True
            else:
                return False

    except Exception as e:
        return False


#==========================================================
# Accept/Reject Order
#==========================================================
@AppVersion_required
@api_view(['POST'])
def AcceptRejectOrder(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)                
                if checkGroup:
                    orderpost_id = request.data['order_id']
                    order_status = request.data['order_status']
                    nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
                    if order_status == 1:
                        OrderPost.objects.filter(id = orderpost_id).update(order_status = ORDER_STATUS_ACCEPTED)
                        rec_id = OrderPost.objects.get(id = orderpost_id)
                        recvId = rec_id.user_id
                        user_exist= DuePayment.objects.filter(user_id=user.id,payment_status=1).exists()
                        if user_exist:
                            due_user = DuePayment.objects.get(user_id=user.id,payment_status=1)
                            due_amount = due_user.amount
                            print(due_amount,"kkk")
                            DuePayment.objects.filter(user_id=user.id,payment_status=1).update(amount=due_amount+rec_id.price)
                        else:
                            DuePayment.objects.create(user_id =user.id,
                                                    amount = rec_id.price,
                                                    payment_status = 1
                                                    )
                        id_noti = User.objects.get(id=recvId)
                        print(id_noti.onoffnotification)
                        if id_noti.onoffnotification == 1:
                            noti = Notification.objects.create(id = uuid.uuid1(),
                                    receiver_id = recvId,
                                    sender_id = user.id,
                                    message = "Accept your order",
                                    tag = "Order Accept",
                                    notification_time = nowTime,
                                    table_id = rec_id.id,
                                    order_id = rec_id.id)
                            try:
                                Token.objects.get(user_id=recvId)
                                notify = SendAcceptOrderNotification(rec_id.id,str(user.fullname)+"has accepted your order","Order Accept",user.id,recvId)
                                return Response({'message':'Order has been accepted'}, status=status.HTTP_200_OK)
                            except:
                                return Response({'message':'Order has been accepted'}, status=status.HTTP_200_OK)
                    elif order_status == 0:
                        OrderPost.objects.filter(id = orderpost_id).update(order_status = ORDER_STATUS_REJECTED)
                        return Response({'message':'Order has been rejected'}, status=status.HTTP_200_OK)                        
                    else:
                        return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED) 
                else:
                    return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED) 
            else:
                    return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#==========================================================
#Past Orders
#==========================================================

from collections import defaultdict


@AppVersion_required
@api_view(['POST'])
def PastOrders(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message": "Session expired!! please login again", "status": "0"},
                                    status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    page_num = request.GET['page_num']
                    order1 = OrderPost.objects.filter(Q(order_status=1) | Q(order_status=2) | Q(order_status=0) | Q(order_status=-2)).filter (user_id = user.id).exclude(buyer_status = -1).order_by('-created_time')
                    

                    paginator = Paginator(order1, 100)
                    
                    try:
                        order1 = paginator.page(page_num)
                    
                    except:
                        order1 = None   
                    timeZone = received_json_data["timeZone"]
                    mainObject = {}
                    if order1:
                        order1serializer = OrderPostSerializer(order1,many=True)
                        order_data = order1serializer.data
                        if order_data.__len__() > 0:
                            oldDate = None
                            mainObject = []
                            tempNum = 0
                        
                            for data in order_data:   
                                obj2 = User.objects.get(id = data['user'])
                                obj3 = PostImage.objects.get(id = data['post_images'])
                                obj1 = Post.objects.get(id = data['post'])
                                price = obj1.price
                                obj4 = Size.objects.get(id = data['size'])

                                data['size_name'] = obj4.size
                                data['price'] = str(price)
                                data['serviceCharge'] = 10.00
                                data['post_description'] = obj1.post_description
                                data['fullname'] = obj2.fullname 
                                data['post_image'] = obj3.post_images  
                                data['colour_name'] = obj3.colour.colour
                                data['post_by'] = obj1.user.fullname
                                data['colour'] = obj3.colour_id

                                

                                newDate = datetime.datetime.strptime(data['created_time'], '%Y-%m-%dT%H:%M:%S.%fZ')
                                # newDate = newDate.astimezone(timezone(timeZone)).replace(tzinfo=None)
                                newDate = newDate.date()

                                b = True
                                if oldDate is None:
                                    oldDate = newDate
                                if tempNum == 0:
                                    listTemp = []
                                    listTemp.append(data)
                                    b = False
                                if oldDate != newDate:
                                    mainObject.append({"date":oldDate, "list":listTemp})
                                    oldDate = newDate
                                    listTemp = []
                                    listTemp.append(data)
                                    b = False
                                if order_data.__len__() == tempNum+1:
                                    if tempNum != 0:
                                        listTemp.append(data)
                                    mainObject.append({"date":oldDate, "list":listTemp})
                                    b = False

                                if b:
                                    listTemp.append(data)

                                tempNum = tempNum + 1;
                        
                        return Response({"response":mainObject, 'has_next':order1.has_next()}, status=status.HTTP_200_OK)  
                    else:
                        return Response({"data" : []}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#==============================================
#Listing of My Req Tab
#==============================================


from collections import defaultdict
from pytz import timezone

#@AppVersion_required
@api_view(['POST'])
def MyRequest(request):
    try:
        with transaction.atomic():
            received_json_data = request.data
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message": "Session expired!! please login again", "status": "0"},
                                    status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    page_num = received_json_data['page_num']
                    # orderpostobj = OrderPost.objects.filter(post_id__user_id=user.id, order_status="PENDING").order_by('-created_time')

                    orderpostobj = OrderPost.objects.filter(post_id__user_id=user.id).exclude(seller_status = -1 ).order_by('-created_time')

                    paginator = Paginator(orderpostobj,100) 

                    try:
                        orderpostobj = paginator.page(page_num)

                    except:
                        orderpostobj = None 
                    timeZone = received_json_data["timeZone"]
                    mainObject = {}
                    if orderpostobj:
                        orderpostserializer = OrderPostSerializer(orderpostobj,many=True)
                        order_list = orderpostserializer.data
                        if order_list.__len__() > 0:
                            oldDate = None
                            mainObject = []
                            tempNum = 0
                            for data in order_list:

                                obj2 = User.objects.get(id = data['user'])

                                obj3 = PostImage.objects.get(id = data['post_images'])
                                obj1 = Post.objects.get(id = data['post'])  
                                price = obj1.price
                                obj4 = Size.objects.get(id = data['size'])
                                data['size_name'] = obj4.size
                                data['colour_name'] = obj3.colour.colour
                                data['post_description'] = obj1.post_description
                                data['price'] = str(price)
                                data['fullname'] = obj2.fullname
                                data['post_image'] = obj3.post_images
                                data['colour'] = obj3.colour_id
                                data['post_by'] = obj1.user.fullname


                                newDate = datetime.datetime.strptime(data['created_time'], '%Y-%m-%dT%H:%M:%S.%fZ')
                                
                                newDate = newDate.astimezone(timezone(timeZone)).replace(tzinfo=None)

                                # nowTime = newDate.timezone.now().replace(tzinfo=None).replace(microsecond=0)

                                newDate = newDate.date()

                                b = True
                                if oldDate is None:
                                    oldDate = newDate
                                if tempNum == 0:
                                    listTemp = []
                                    listTemp.append(data)
                                    b = False
                                if oldDate != newDate:
                                    mainObject.append({"date":oldDate, "list":listTemp})
                                    oldDate = newDate
                                    listTemp = []
                                    listTemp.append(data)
                                    b = False
                                if order_list.__len__() == tempNum+1:
                                    if tempNum != 0:
                                        listTemp.append(data)
                                    mainObject.append({"date":oldDate, "list":listTemp})
                                    b = False

                                if b:
                                    listTemp.append(data)

                                tempNum = tempNum + 1;

                        return Response({"response":mainObject, 'has_next':orderpostobj.has_next()}, status=status.HTTP_200_OK) 
                    else:
                        return Response({"data" : []}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#====================================================
#Order Delete
#====================================================

@AppVersion_required
@api_view(['POST'])
def OrderDelete(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                order_id = request.data['order_id']
                if checkGroup:
                    orderobj = OrderPost.objects.filter(id = order_id).filter(post_id__user_id = user.id)
                    if orderobj:
                        order1 = OrderPost.objects.filter(id = order_id).update(seller_status = -1)
#                        notify = Notification.objects.filter(tag = "order place").
                    else:
                        order1 = OrderPost.objects.filter(id = order_id).update(buyer_status = -1)
                    if order1:
                        return Response({"message" : deleteSuccessMessage}, status=status.HTTP_200_OK)
                    else:
                        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)  
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)





#====================================================
#Order Detail
#======================================================

@AppVersion_required
@api_view(['POST'])
def OrderDetail(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                order_id = request.data['order_id']
                if checkGroup:
                    order1 = OrderPost.objects.filter(id = order_id)
                    if order1:
                        order1serializer = OrderPostSerializer(order1,many=True)
                        order_data = order1serializer.data
                        for data in order_data:
                            obj1 = Post.objects.get(id = data['post'])
                            price = obj1.price
                            obj2 = PostImage.objects.get(id = data['post_images'])
                            obj3 = User.objects.get(id = data['user'])
                            obj4 = Size.objects.get(id = data['size'])
                            data['size_name'] = obj4.size
                            data['colour_name'] = obj2.colour.colour
                            data['post_images'] = obj2.post_images
                            data['colour'] = obj2.colour_id
                            data['post_description'] = obj1.post_description
                            data['price'] = str(price)
                            data['serviceCharge'] = 10.00
                            data['order_by'] = obj3.fullname
                            data['order_by_image'] = obj3.image

                            order_by_id = obj3.id
                            design_by_id = obj1.user.id
                            data['design_by_id'] = design_by_id
                            data['design_by'] = obj1.user.fullname           
                            data['design_by_image'] = obj1.user.image
                            data['design_by_address'] = obj1.user.address
                            newDate = datetime.datetime.strptime(data['created_time'], '%Y-%m-%dT%H:%M:%S.%fZ')
                            newDate = newDate.date()
                            data['date'] = newDate
                            if order_by_id == user.id:
                               data['message_id'] = obj1.user.id
                            else:
                                data['message_id'] = obj3.id 

                            report1 = ReportPost.objects.filter(user_id = user.id, post_id = obj1.id)
                            if report1:
                                data['report_post'] = True
                            else:
                                data['report_post'] = False
                           
                            last_ad = OrderTrn.objects.filter(user_id=obj3.id).order_by('-transaction_time').first()
                            if last_ad:
                                add1 = Addresses.objects.filter(id=last_ad.address.id,status=1).values("first_name","last_name","city","postal_code","city","address","phone")
                                
                                if add1:
                                   data['order_by_address'] = add1
                             
                        return Response({"data":data}, status=status.HTTP_200_OK) 
                    else:
                        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#======================================================
# Cancel Order
#======================================================

@AppVersion_required
@api_view(['POST'])
def CancelOrder(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)                
                if checkGroup:
                    orderpost_id = request.data['order_id']
                    order_status = request.data['order_status']
                    if order_status == -2 :
                        OrderPost.objects.filter(id = orderpost_id).update(order_status = ORDER_STATUS_CANCEL)
                        return Response({'message':'Order has been Cancelled'}, status=status.HTTP_200_OK)             
                    else:
                        return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED) 
                else:
                    return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED) 
            else:
                    return Response({"status": "0", 'message':errorMessage}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#====================================================
# Notification List
#====================================================

@api_view(['GET'])
@AppVersion_required
def GetNotificationList(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='User').exists()
                except:
                    return Response({"message": "Session expired!! please login again", "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
                    
                
#                page_num = request.GET['page_num']
                if checkGroup:
                    notificationObjs = Notification.objects.filter(receiver_id=user.id).order_by('-notification_time')

 #                   paginator = Paginator(notificationObjs, 4)
  #                  try:
   #                    notificationObjs = paginator.page(page_num)
    #                except:
     #                  notificationObjs = None

                    if notificationObjs:
                        serializedData = NotificationSerializer(notificationObjs,many=True).data
                        for data in serializedData:
                            obj1 = User.objects.get(id = data['sender'])
                            obj2 = User.objects.get(id = data['receiver'])
                            obj3 = FollowUser.objects.filter(follow_by_id = user.id, follow_to_id =data['sender'])
                            data['sender_name'] = obj1.fullname
                            data['sender_image'] = obj1.image
                            data['receiver_image'] = obj2.image
                            
                            if data['tag'] == "like" or data['tag'] == "order place":
                                 obj5 = PostImage.objects.filter(post_id = data['table_id'])
                                 for i in obj5:
                                     data['post_image'] = i.post_images
                            elif data['tag'] == "Order Accept":
                                obj7 = OrderPost.objects.get(id = data['table_id'])
                                jj = obj7.post_id
                                obj8 = PostImage.objects.filter(post_id = jj)
                                for k in obj8:
                                    data['post_image'] = k.post_images
                            else:
                                data['post_image'] = None

                            if obj3:
                                data["follow_status"] = True
                            else:
                                data["follow_status"] = False
                            objs = Notification.objects.filter(receiver_id=user.id).update(is_read=1)
                        return Response({'message': 'success', 'data': serializedData},status=status.HTTP_200_OK)
                    else:
                        return Response({"data": []}, status=status.HTTP_200_OK)
                else:
                    return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)

    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#================================================
# delete notification
#================================================

@AppVersion_required
@api_view(['GET'])
def DeleteNotification(request):
    try:
        with transaction.atomic():
                API_key = request.META.get('HTTP_AUTHORIZATION')
                if API_key is not None:
                    try:
                        token1 = Token.objects.get(key=API_key)
                        user = token1.user
                        checkGroup = user.groups.filter(name='User').exists()
                    except:
                        return Response({"message": "Session expired!! please login again", "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

                    if checkGroup:
                       notiff = Notification.objects.filter(receiver_id = user.id)
                       if notiff:
                           nott = Notification.objects.filter(receiver_id=user.id).delete()
                           return Response({"message": deleteSuccessMessage},status=status.HTTP_200_OK) 
                       else:
                           return Response({"message" : "you don't have any notification"}, status=status.HTTP_200_OK)
                    else:
                        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)   
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def priceindecimal(postjson):
    try:
        for index, data in  enumerate(postjson.data):
            data['price'] = Decimal(data['price'])
    except Exception:
        print("Something Wents Wrong")

###############################################################################################
#                           Custom design
##############################################################################################

@AppVersion_required
@api_view(['GET'])
def getCustomList(request):  
    try:
        with transaction.atomic():
            # received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='User').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            
            fabric = Fabric.objects.all()
            fabricserializer = FabricSerializer(fabric,many=True)
            priceindecimal(fabricserializer)

            fabriccolour = FabricColour.objects.all()
            fabriccolourserializer = FabricColourSerializer(fabriccolour,many=True)
            oobj = fabriccolourserializer.data

            b = {}
            for index, data in  enumerate(oobj):
                fabric_colour_images = FabricColourImage.objects.filter(fabriccolour_id=data['id'], status=1)
                if fabric_colour_images:
                    present_colours = FabricColourImageSerializer(fabric_colour_images, many=True)
                    oobj[index]['fabric_Colour_images'] = present_colours.data

            oobj.insert(0,b)

            clothstyle = ClothStyle.objects.all()
            clothstyleserializer = ClothStyleSerializer(clothstyle,many=True)
            priceindecimal(clothstyleserializer)
            obj = clothstyleserializer.data

            ##add cloth style clour in list
            for index, data in  enumerate(obj):
                clothstyle_colour = ClothStyleColour.objects.filter(cloth_style_id=data['id'], status=1)
                if clothstyle_colour:
                    present_colours = ClothStyleColourSerializer(clothstyle_colour, many=True)
                    obj[index]['clothStyle_Colour'] = present_colours.data

                    for index1,data1 in enumerate(obj[index]['clothStyle_Colour']):
                        print("djdfhghf")
                        clothstyle_pattern = ClothStylePatternColourImage.objects.filter(colour_id=data1['id'],status=1)
                        print(clothstyle_pattern)
                        if clothstyle_pattern:
                            clothstyle_pattern_present = ClothStylePatternColourImageSerializer(clothstyle_pattern,many=True)
                            obj[index]['clothStyle_Colour'][index1]['clothStyle_colour_pattern'] = clothstyle_pattern_present.data

            

            ##add pattern
            a={}
            for index,data in enumerate(obj):
                pattern = Pattern.objects.all()
                if pattern:
                    patternserializer = PatternSerializer(pattern,many=True)
                    priceindecimal(patternserializer)
                    obj[index]['clothStyle_pattern'] = patternserializer.data
                    obj[index]['clothStyle_pattern'].insert(0,a)
               

            shape = Shape.objects.all()
            shapeserializer = ShapeSerializer(shape,many=True)
            priceindecimal(shapeserializer)

            shapecolour = ShapeColour.objects.all()
            shapecolourserializer = ShapeColourSerializer(shapecolour,many=True)

            sew = Sew.objects.all()
            sewserializer = SewSerializer(sew,many=True)


            return Response({"message" : "Response Send Succesfully","status" : "1","clothstyle":obj ,"shape":shapeserializer.data,"shape_colour":shapecolourserializer.data,"fabric":fabricserializer.data,"fabric_colour":oobj,"sew":sewserializer.data}, status=status.HTTP_200_OK)      
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#################################################################
#            Add bank account
##################################################################

@api_view(['POST'])
def AddBank(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                except:
                    return Response({"message" : "Session expired!! please login again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                checkGroup = user.groups.filter(name='User').exists()

                if checkGroup:
                    stripe.api_key = settings.STRIPE_SECRET_KEY
                    account_holder_name = request.data['account_holder_name']
                    account_holder_type = request.data['account_holder_type']
                    routing_number = request.data["routing_number"]
                    account_number = request.data["account_number"]
                    if user.has_bank_account == 0:
                        bankacc = BankDetail.objects.create(Account_name = account_holder_name,
                                                            Type = account_holder_type,
                                                            routing_number = routing_number,
                                                            acc_number = account_number,
                                                            user_id = user.id)
                        if bankacc is not None:
                            User.objects.filter(id=user.id).update(has_bank_account=1)
                            return Response({"message" : "Bank added successfully", "status" : "1", "bank_detail": BankDetailSerializer(bankacc).data}, status=status.HTTP_200_OK)
                    else:
                        bankacc = BankDetail.objects.filter(user_id=user.id).update(Account_name = account_holder_name,
                                                            Type = account_holder_type,
                                                            routing_number = routing_number,
                                                            acc_number = account_number,
                                                            user_id = user.id)

                        if bankacc is not None:
                            detail = BankDetail.objects.get(user_id=user.id)
                            serl = BankDetailSerializer(detail).data
                            print(serl,"hgjh")
                            return Response({"message" : "Bank detail updated sucessfully", "status" : "1","bank_detail":serl}, status=status.HTTP_200_OK)
       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#======================================================
# Admin API's
#======================================================

#========================================
# api for SignUp user
#========================================
# @AppVersion_required
@csrf_exempt
@api_view(['POST'])
def SignUpAdmin(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body.decode('utf-8'), strict=False)
            try:
                user = User.objects.get(email = received_json_data['email'])
                return Response({"message" : errorEmailExist, "status" : "0"}, status=status.HTTP_409_CONFLICT)
            except:
                authuser = User.objects.create(email = received_json_data['email'],
                                                phone = received_json_data['phone'],
                                                username = received_json_data['email'],
                                                password = make_password(received_json_data['password']),
                                                deviceId = received_json_data['deviceId'],
                                                deviceType = received_json_data['deviceType'])
                g = Group.objects.get(name='Admin')
                g.user_set.add(authuser)
                token = Token.objects.create(user=authuser)
                return Response({"message" : addSuccessMessage,"token":token.key ,"status" : "1"}, status=status.HTTP_201_CREATED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#===========================================
# adding promo post by admin
#===========================================

@api_view(['POST'])
def addadminPost(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.data['data'], strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            user1 = User.objects.get(id = user.id)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)
            post = Post.objects.create(
                                        post_description = received_json_data['post_description'],
                                        user_id = user1.id,
                                        created_time = nowTime,
                                        post_status = 1)
           
            if post is not None:
                post_count = user1.post_count
                User.objects.filter(id = user.id).update(post_count = post_count+1)
                file = request.FILES.get('post_image')
                fs = FileSystemStorage()
                filename = fs.save("postimages/"+str(post.id)+"/"+file.name, file)
                uploaded_file_url = fs.url(filename)
                
                PostImage.objects.create(post_images = uploaded_file_url,post_id = post.id)
                return Response({"message" : addPostSuccessMessage, "status" : "1"}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#=========================================
# Registered Users
#=========================================

@api_view(['POST'])
def RegisteredUsers(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            registered = User.objects.all()
            if registered:
                registered_serializer = UserSerializer(registered, many=True)
                data = registered_serializer.data
            

            return Response({"message" : "list of users","data":data}, status=status.HTTP_201_CREATED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#=========================================
# Total Users
#=========================================

@api_view(['GET'])
def RegisteredUsers(request):
    # try:
    #     with transaction.atomic():
    #         try:
    #             API_key = request.META.get('HTTP_AUTHORIZATION')
    #             token1 = Token.objects.get(key=API_key)
    #             user = token1.user
    #             checkGroup = user.groups.filter(name='Admin').exists()
    #             if checkGroup == False:
    #                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    #         except:
    #             return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            registered = User.objects.all().count()
            # if registered:
            #     registered_serializer = UserSerializer(registered, many=True)
            #     data = registered_serializer.data
            

            return Response({"message" : "list of users","data":registered}, status=status.HTTP_201_CREATED)
    # except Exception:
    #     print(traceback.format_exc())
    #     return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#=====================================
#Active Users
#=====================================

@api_view(['GET'])
def ActiveUsers(request):
    # try:
    #     with transaction.atomic():
    #         try:
    #             API_key = request.META.get('HTTP_AUTHORIZATION')
    #             token1 = Token.objects.get(key=API_key)
    #             user = token1.user
    #             checkGroup = user.groups.filter(name='Admin').exists()
    #             if checkGroup == False:
    #                 return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
    #         except:
    #             return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
    nowTime = datetime.datetime.now()
    now_minus_10 = nowTime - datetime.timedelta(minutes = 10)
    # count = User.objects.filter(lastUpdated__startswith=timezone.now().date()).count()
    # count = User.objects.filter(lastUpdated__startswith=now_minus_10).count()
    count = User.objects.filter(lastUpdated__gte=now_minus_10).count()
    
    return Response({"message" : "list of users","data":count}, status=status.HTTP_201_CREATED)
    # except Exception:
    #     print(traceback.format_exc())
    #     return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#==========================================
#Total Orders
#==========================================
@api_view(['GET'])
def TotalOrders(request):
    registered = OrderTrn.objects.all().count()
    return Response({"message" : "total orders","data":registered}, status=status.HTTP_201_CREATED)



#===========================================
# promo  post
#===========================================



#===========================================
# payment
#===========================================
# filter payment by username and date





#===========================================
# notifications
#===========================================
# help support
# like and comments on post
# report post
# list posts
import pdb
#########################################################################################################################
#########################################################################################################################
#****************************************************Admin Apis**********************************************************
#########################################################################################################################
#########################################################################################################################

############################################################
#         Admin login
############################################################

############################################################
#             Admin Register
############################################################



@csrf_exempt
@api_view(['POST'])
def AdminRegister(request):
    try:
        with transaction.atomic():
            deviceId = request.data['device_id']
            email = request.data['email']
            if request.POST.get('deviceType') is not None:
                deviceType = request.data['deviceType']
            else:
                deviceType = "a"
            if email is None or email == "Null" or email == "null":
                email = deviceId+"@Distaff.com"
            username = email
            nowTime = datetime.datetime.now()  
       
            try:
                existedUser = User.objects.get(device_id =deviceId)
            except:
                existedUser = None
            if existedUser is not None:
                return Response({"status" : "1", 'message':'User Already Registered'}, status=status.HTTP_200_OK)
            else:
                authUser = User.objects.create(username=email,
                                         email=email,
                                         first_name='firstname',
                                         last_name='',
                                         password=make_password(request.data['password']),
                                         deviceType=deviceType,
                                         deviceId=deviceId,
                                         date_joined= nowTime,
                                         is_superuser=0,
                                         is_staff=0,
                                         is_active=1,
                                         role=2 )
                serialized_data = UserSerializer(authUser)
                g = Group.objects.get(name='Admin')
                g.user_set.add(authUser)
                token = Token.objects.create(user=authUser)    
                userDetail = {'token':token.key, 'user': serialized_data.data}
                return Response({"status" : "1", 'message':'User has been successfully registered.', 'user' : userDetail}, status=status.HTTP_200_OK)                               
    except Exception as e:
        print(traceback.format_exc())
        return Response({'status':0, 'message':"Something Wrong."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#############################################################
#           Admin Login
############################################################

@csrf_exempt
@api_view(['POST'])
def AdminLogin(request):
    try:
        with transaction.atomic():
            deviceId = request.data['device_id']
            email = request.data['email']
            password = request.data['password']
            if request.POST.get('deviceType') is not None:
                deviceType = request.data['deviceType']
            else:
                deviceType = "a"
            if email is None or email == "Null" or email == "null":
                email = deviceId+"@Distaff.com"
            username = email
            nowTime = datetime.datetime.now() 
            is_email_error = False      
            try:
                existedUser = User.objects.get(email =email)

            except:
                existedUser = None
                is_email_error = True
            if existedUser is not None:
                authUser = authenticate(username=email, password=password)
                if authUser is not None:
                    checkGroup = authUser.groups.filter(name='Admin').exists()
                    if checkGroup:
                        token = ''                    
                        try:
                            user_with_token = Token.objects.get(user=authUser)
                        except:
                            user_with_token = None
                        if user_with_token is None:
                            token1 = Token.objects.create(user=authUser)
                            token = token1.key
                        else:
                            Token.objects.get(user=authUser).delete()
                            token1 = Token.objects.create(user=authUser)
                            token = token1.key 
                        serialized_data = UserSerializer(existedUser)
                        userDetail = {'token':token, 'user': serialized_data.data }
                        User.objects.filter(id=existedUser.id).update(lastUpdated = nowTime)
                        return Response({"status" : "1", 'message':'User Login Sucessfully', 'data':userDetail, 'is_email_error':is_email_error}, status=status.HTTP_200_OK)

                else:
                        return Response({"status" : "1", 'message':'Email Or Password is Wrong.','is_email_error':is_email_error}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({"status" : "1", 'message':'Please Register Your Account.','is_email_error':is_email_error}, status=status.HTTP_400_BAD_REQUEST)
                               

    except Exception as e:
        print(traceback.format_exc())
        return Response({'status':0, 'message':"Something Wrong."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

############################################################
#     Get Admin profile
############################################################


@api_view(['GET'])
def Get_Admin_Profile(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token1 = Token.objects.get(key=API_key)
                    user = token1.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except:
                    return Response({"message": "Session expired!! please login again", "status": "0"},
                                    status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    user = User.objects.filter(id=user.id)
                    if user is not None:
                        user_serializer = UserSerializer(user, many = True)
                        return Response({"message" : addSuccessMessage, "response" : user_serializer.data, "status" : "1"}, status=status.HTTP_200_OK)
                    else:
                        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                    
                    
            else:
                return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_401_UNAUTHORIZED)

    except Exception as e:
        print(traceback.format_exc())
        return Response({"message": errorMessage, "status": "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


###############################################################
#                      Edit Admin Profile
###############################################################


@api_view(['POST'])
def EditProfile(request):
    try:
        with transaction.atomic():
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='Admin').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            user.first_name = request.data.get('first_name')  
            user.last_name = request.data.get('last_name') 
            user.email = request.data.get('email')   
            user.username = request.data.get('email')           
            user.save(update_fields=['first_name', 'last_name', 'email', 'username'])
            return Response({"Message": "User Updated Successfully.", "user": user.id,"status" : "1"}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


############################################################
#     Get Dashboard Data
############################################################

@api_view(['GET'])
def Dashboard(request):
    try:
        with transaction.atomic():
            
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                
                token1 = Token.objects.get(key=api_key)
                user = token1.user
            
                check_group = user.groups.filter(name='Admin').exists()
        
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)

            
            registered_user = User.objects.filter(is_staff=0,role=0).count()  

            nowTime = datetime.datetime.now()

            now_minus_10 = nowTime - datetime.timedelta(minutes = 10)
        
            active_user = User.objects.filter(lastUpdated__gte=now_minus_10,is_staff=0,role=0).count() 

            total_order = OrderTrn.objects.all().count()

            return Response({"total_users" : registered_user, "total_active_users" : active_user,"total_order": total_order,"status" : "1"}, status=status.HTTP_200_OK)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



########################################################################################
#                           logout Admin User
########################################################################################

@api_view(['POST'])
def LogutAdminUser(request):
    try:
        with transaction.atomic():
            API_Key = request.META.get('HTTP_AUTHORIZATION')
            if API_Key is not None:
                try:
                    token1 = Token.objects.get(key=API_Key)
                    user = token1.user
            
                except:
                    token1 = None
                    user = None
                if user is not None:
                    user.auth_token.delete()
                    return Response({"message": "Logged Out Successfully","status":"1"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage,"status":"0"},status = status.HTTP_401_UNAUTHORIZED)
            else:
                return Response({"message": errorMessage, "status":"0"},status = status.HTTP_401_UNAUTHORIZED)

    except Exception:
        print(traceback.format_exc())
        return Response({"message": errorMessage,"status":"0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)


##################################################################################################################
#                                 Change Admin Password
##################################################################################################################

@api_view(['POST'])
def Change_Admin_Password(request):
    try:
        with transaction.atomic():
            API_Key = request.META.get('HTTP_AUTHORIZATION')
        
            if API_Key is not None:
                try:
                    print("jj")
                    token1 = Token.objects.get(key=API_Key)
                    print(token1,"token")
                    user = token1.user
                    print(user,"user")
                    checkGroup = user.groups.filter(name='Admin').exists()
                    print(checkGroup,"checkGroup")
                except:
                    return Response({"message": "Session expired! please login again", "status":"0"},status=status.HTTP_401_UNAUTHORIZED)
                if checkGroup:
                    print("djhdgvhdghvdghd")
                    user1 = User.objects.get(id=user.id)
                    print(user1)
                    currentPassword = request.data['currentPassword']
                    print(currentPassword,"currentPassword")
                    newPassword = request.data['newPassword']
                    print(newPassword,"newPassword")
                    confirmPassword = request.data['confirmPassword']
                    print(confirmPassword,"confirmPassword")
                    success = user.check_password(str(currentPassword))
                    print(success,"kkjghgfg")
                    if success:
                        if currentPassword == newPassword:
                            return Response({"message": "Please Enter a Different new Password", "status":"0"},status=status.HTTP_406_NOT_ACCEPTABLE)
                        else:
                            u = User.objects.get(id=user.id)
                            print(u,"user")
                            if newPassword == confirmPassword:
                                u.set_password(newPassword)
                                result = User.objects.filter(id=user.id).update(password = make_password(newPassword))
                                print(result,"resuullttt")
                                if result:
                                    return Response({"status":"1","message": "Password Changed Successfully"},status=status.HTTP_200_OK)
                                else:
                                    return Response({"message": errorMessage,"status":"0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                            else:
                                    return Response({"message": "newPassword and ConfirmPassword not Matched","status":"0"},status=status.HTTP_406_NOT_ACCEPTABLE)

                    else:
                        return Response({"message": "current password incorrect","status":"0"},status=status.HTTP_406_NOT_ACCEPTABLE)
                else:
                    return Response({"message": "Session expired! please login again", "status":"0"},status=status.HTTP_401_UNAUTHORIZED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message": errorMessage,"status":"0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#############################################################################################
#                                 upload file
#############################################################################################

@api_view(['POST'])
def uploadfile(request):
    try:
        with transaction.atomic():  
            try:
                print(request.data.get('id'),"iiii")
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                check_group = user.groups.filter(name='Admin').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)

            try:
                if request.data.get('type') == "notifications":
                    is_array = isinstance(request.data.get('id').split(','), list)
                    print(is_array,"array")
                    request_id = request.data.get('id').split(',')
                    print(request_id,"idddddd")
                else:
                    request_id = int(request.data.get('id'))
            except:
                request_id = None
            print(request_id)
            if request_id is not None:
                
                if request.data.get('type') == "post":
                    file = request.FILES.get('file')
                    fs = FileSystemStorage()
                    filename = fs.save("postimages/"+str(request_id)+"/"+file.name, file)
                    uploaded_file_url = fs.url(filename)
                    PostImage.objects.create(post_images = uploaded_file_url,post_id =request_id)
                if request.data.get('type') == "userprofile":
                    file = request.FILES.get('file')
                    fs = FileSystemStorage()
                    filename = fs.save("userimage/"+str(request_id)+"/"+file.name, file)
                    uploaded_file_url = fs.url(filename)
                    User.objects.filter(id = request_id).update(image = uploaded_file_url)

                return Response({"message" : "Response Send Succesfully","status" : "1"}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)       

    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


####################################################################################
#                    list of active users
####################################################################################

@api_view(['GET'])
def Active_Users(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            nowTime = datetime.datetime.now()
            now_minus_10 = nowTime - datetime.timedelta(minutes = 10)
            activity = User.objects.filter(lastUpdated__gte=now_minus_10,is_staff=0,role=0)
            count = User.objects.filter(lastUpdated__gte=now_minus_10).count()
            userserializer = UserSerializer(activity,many=True)
            user_serial = userserializer.data
            for i in user_serial:
                i1['user_name'] = i1['user_name'][:30]
                i1['email'] = i1['email'][:30]
            return Response({"message" : "Response Send Succesfully","status" : "1","response":user_serial}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

################################################################################################
#                             list of registered users
################################################################################################

@api_view(['GET'])
def Registered_Users(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            
            # userss = User.objects.all()
            # users = Group.objects.filter(user__in=userss,name='User')
            # user_list = User.objects.filter(id__in=users)
            # if user_list is not None:
            #     userserializer = UserSerializer(user_list,many=True)
            users = User.objects.filter(is_staff=0,role=0)
            totaluser = User.objects.all().count()  # total users
            print("i", users)
            print("p", totaluser)
            for i in users:
                checkGroup = i.groups.filter(name='User').exists()
                print("00", checkGroup)
                
                if checkGroup:
                    userserializer = UserSerializer(users,many=True)
                    user_serial = userserializer.data
                    for i1 in user_serial:
                        i1['user_name'] = i1['user_name'][:30]
                        i1['email'] = i1['email'][:30]
                    return Response({"message" : "Response Send Succesfully","status" : "1","response":user_serial}, status=status.HTTP_200_OK)
                else:
                    print("admin")
            
                
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



############################################################
#                   Show Profile
############################################################

@api_view(['POST'])
def Show_Profile(request):
    try:
        with transaction.atomic():
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                userId = request.data.get('userId')
                check_group = user.groups.filter(name='Admin').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            print(userId)
            try:
                userr = User.objects.get(id=userId)
            except:
                userr=None
            if userr is not None:
                user_detail = UserSerializer(userr)
                userserializer = user_detail.data
                userserializer['user_name'] = userserializer['user_name'][:30]
                userserializer['fullname'] = userserializer['fullname'][:30]
                userserializer['email'] = userserializer['email'][:30]
                userserializer['about_me'] = userserializer['about_me'][:30]


                ####################post of the user
                post_count = Post.objects.filter(user_id=userId).count()
                post_user = Post.objects.filter(user_id=userId).order_by('-created_time')
                post_user_serializer = PostSerializer(post_user,many=True)
                poost = post_user_serializer.data
                ###################post images
                for i in poost:
                    i['post_description'] = i['post_description'][:30]
                    pst_image = PostImage.objects.filter(post_id=i['id']).values("post_images")
                    for i1 in pst_image:
                        i['image'] = i1['post_images']

        


                return Response({"message" : addSuccessMessage, "status" : "1", "userr": userserializer,"user_post":post_user_serializer.data,"total_post":post_count}, status=status.HTTP_201_CREATED)
            else:
                return Response({"message" : "User Not Found", "status" : "1"}, status=status.HTTP_201_CREATED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


############################################################
#                   Show Post
############################################################

@api_view(['POST'])
def Show_Post(request):
    try:
        with transaction.atomic():
            try:
                api_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=api_key)
                user = token1.user
                postId = request.data.get('postId')
                check_group = user.groups.filter(name='Admin').exists()
                if check_group == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                print(traceback.format_exc())
                return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            
            try:
                pst = Post.objects.get(id=postId)
            except:
                pst=None
            if pst is not None:
                post_detail = PostSerializer(pst)
                pstserializer = post_detail.data
                print(pstserializer)
                ###################post images

                pst_image = PostImage.objects.filter(post_id=pstserializer['id']).values("post_images")
                for i1 in pst_image:
                    pstserializer['image'] = i1['post_images']

                
                return Response({"message" : addSuccessMessage, "status" : "1", "reported_post": pstserializer}, status=status.HTTP_201_CREATED)
            else:
                return Response({"message" : "User Not Found", "status" : "1"}, status=status.HTTP_201_CREATED)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


######################################################################################
#                          get_trans_detail
######################################################################################

@api_view(['GET'])
def Trans_Detail(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            ############### Search Start ################
            try:
                search = request.GET.get('search')
            # except:
            #     search = None
                if search is not None:
                    print("if chla")
                    data = json.loads(request.GET.get('data'), strict=False)
                    print(data)
                    #########################all filter##############################

                    # if ((data['user_name']!='') and (data['start_date']!='') and (data['end_date']!='')):
                    #     print("all filter")

                    #     orders = OrderTrn.objects.all().count()
                    #     # start_date = datetime.datetime.strptime(data['start_date'], "%d/%m/%Y").strftime("%Y-%m-%d")
                    #     # print(stat_date)
                    #     user_id = User.objects.get(user_name=data['user_name'])
                    #     trans = OrderTrn.objects.filter(user_id=user_id.id,transaction_time__lte=data['start_date'],transaction_time__gt=data['end_date']).order_by('-transaction_time')
                    #     if trans:

                    #         transerializer = OrderTrnSerializer(trans,many=True)
                    #         trans = transerializer.data
                    #         for ii in trans:
                    #             ii['transaction_time'] = ii['transaction_time'][:10]
                    #             ii['refund_time'] = ii['refund_time'][:10]
                    #         for index,data in enumerate(trans):
                    #             trans_user = User.objects.filter(id=data['user'])
                    #             if trans_user:
                    #                 trans_user_serializer = UserSerializer(trans_user,many=True)
                    #                 trans[index]['user'] = trans_user_serializer.data[0]

                    #         return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                    #     else:
                    #         return Response({"message" : "Response Send Succesfully","status" : "1","response":[]}, status=status.HTTP_200_OK)

                    # elif ((data['user_name']!='') and (data['start_date']!=None) and (data['end_date']!=None)):
                    #     print("all filter")

                    #     orders = OrderTrn.objects.all().count()
                    #     # start_date = datetime.datetime.strptime(data['start_date'], "%d/%m/%Y").strftime("%Y-%m-%d")
                    #     # print(stat_date)
                    #     user_id = User.objects.get(user_name=data['user_name'])
                    #     trans = OrderTrn.objects.filter(user_id=user_id.id,transaction_time__lte=data['start_date'],transaction_time__gt=data['end_date']).order_by('-transaction_time')
                    #     if trans:

                    #         transerializer = OrderTrnSerializer(trans,many=True)
                    #         trans = transerializer.data
                    #         for ii in trans:
                    #             ii['transaction_time'] = ii['transaction_time'][:10]
                    #             ii['refund_time'] = ii['refund_time'][:10]
                    #         for index,data in enumerate(trans):
                    #             trans_user = User.objects.filter(id=data['user'])
                    #             if trans_user:
                    #                 trans_user_serializer = UserSerializer(trans_user,many=True)
                    #                 trans[index]['user'] = trans_user_serializer.data[0]

                    #         return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                    #     else:
                    #         return Response({"message" : "Response Send Succesfully","status" : "1","response":[]}, status=status.HTTP_200_OK)

                    ###########################empty filter##########################################

                    if ((data['user_name']=='') and (data['start_date']=='') and (data['end_date']=='')):
                        print("empty filter")
                        orders = OrderTrn.objects.all().count()
                        trans = OrderTrn.objects.all().order_by('-transaction_time')
                        print(trans)
                        if trans:

                            transerializer = OrderTrnSerializer(trans,many=True)
                            trans = transerializer.data
                            for ii in trans:
                                ii['transaction_time'] = ii['transaction_time'][:10]
                                ii['refund_time'] = ii['refund_time'][:10]
                                ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                            for index,data in enumerate(trans):
                                trans_user = User.objects.filter(id=data['user'])
                                if trans_user:
                                    trans_user_serializer = UserSerializer(trans_user,many=True)
                                    trans[index]['user'] = trans_user_serializer.data[0]

                            return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    elif ((data['user_name']=='') and (data['start_date']==None) and (data['end_date']==None)):
                        print("empty filter")
                        orders = OrderTrn.objects.all().count()
                        trans = OrderTrn.objects.all().order_by('-transaction_time')
                        print(trans)
                        if trans:

                            transerializer = OrderTrnSerializer(trans,many=True)
                            trans = transerializer.data
                            for ii in trans:
                                ii['transaction_time'] = ii['transaction_time'][:10]
                                ii['refund_time'] = ii['refund_time'][:10]
                                ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                            for index,data in enumerate(trans):
                                trans_user = User.objects.filter(id=data['user'])
                                if trans_user:
                                    trans_user_serializer = UserSerializer(trans_user,many=True)
                                    trans[index]['user'] = trans_user_serializer.data[0]

                            return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    ##################################user filter########################################
                    elif ((data['user_name']!='') and (data['start_date']=='') and (data['end_date']=='')):
                        print("user filter")
                        orders = OrderTrn.objects.all().count()
                        user_id = User.objects.get(user_name=data['user_name'])
                        if user_id:
                            trans = OrderTrn.objects.filter(user_id=user_id.id).order_by('-transaction_time')
                            print(trans)
                            if trans:
                                transerializer = OrderTrnSerializer(trans,many=True)
                                trans = transerializer.data
                                for ii in trans:
                                    ii['transaction_time'] = ii['transaction_time'][:10]
                                    ii['refund_time'] = ii['refund_time'][:10]
                                    ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                                for index,data in enumerate(trans):
                                    trans_user = User.objects.filter(id=data['user'])
                                    if trans_user:
                                        trans_user_serializer = UserSerializer(trans_user,many=True)
                                        trans[index]['user'] = trans_user_serializer.data[0]

                                return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                            else:
                                return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    elif ((data['user_name']!='') and (data['start_date']==None) and (data['end_date']==None)):
                        print("user filter")
                        try:
                            orders = OrderTrn.objects.all().count()
                            user_id = User.objects.get(user_name=data['user_name'])
                            print(user_id,"llll")
                       

                            trans = OrderTrn.objects.filter(user_id=user_id.id).order_by('-transaction_time')
                            print(trans)
                            if trans:

                                transerializer = OrderTrnSerializer(trans,many=True)
                                trans = transerializer.data
                                for ii in trans:
                                    ii['transaction_time'] = ii['transaction_time'][:10]
                                    ii['refund_time'] = ii['refund_time'][:10]
                                    ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                                for index,data in enumerate(trans):
                                    trans_user = User.objects.filter(id=data['user'])
                                    if trans_user:
                                        trans_user_serializer = UserSerializer(trans_user,many=True)
                                        trans[index]['user'] = trans_user_serializer.data[0]

                                return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                            else:
                                return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)
                        except:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    ####################################date filter###########################################

                    elif ((data['user_name']=='') and (data['start_date']!='') and (data['end_date']!='')):
                        print("date filter")
                        orders = OrderTrn.objects.all().count()
                        trans_sum = OrderTrn.objects.filter(transaction_time__gt=data['start_date'],transaction_time__lte=data['end_date']).aggregate(Sum('total_amount'))
                        print(trans_sum)
                        trans = OrderTrn.objects.filter(transaction_time__gte=data['start_date'],transaction_time__lte=data['end_date']).order_by('-transaction_time')
                        print(trans)
                        if trans:

                            transerializer = OrderTrnSerializer(trans,many=True)
                            trans = transerializer.data
                            for ii in trans:
                                ii['transaction_time'] = ii['transaction_time'][:10]
                                ii['refund_time'] = ii['refund_time'][:10]
                                ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                            for index,data in enumerate(trans):
                                trans_user = User.objects.filter(id=data['user'])
                                if trans_user:
                                    trans_user_serializer = UserSerializer(trans_user,many=True)
                                    trans[index]['user'] = trans_user_serializer.data[0]

                            return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    elif ((data['user_name']=='') and (data['start_date']!=None) and (data['end_date']!=None)):
                        print("date filter")
                        orders = OrderTrn.objects.all().count()
                        trans_sum = OrderTrn.objects.filter(transaction_time__gt=data['start_date'],transaction_time__lte=data['end_date']).aggregate(Sum('total_amount'))
                        print(trans_sum)
                        trans = OrderTrn.objects.filter(transaction_time__gte=data['start_date'],transaction_time__lte=data['end_date']).order_by('-transaction_time')
                        print(trans)
                        if trans:

                            transerializer = OrderTrnSerializer(trans,many=True)
                            trans = transerializer.data
                            for ii in trans:
                                ii['transaction_time'] = ii['transaction_time'][:10]
                                ii['refund_time'] = ii['refund_time'][:10]
                                ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                            for index,data in enumerate(trans):
                                trans_user = User.objects.filter(id=data['user'])
                                if trans_user:
                                    trans_user_serializer = UserSerializer(trans_user,many=True)
                                    trans[index]['user'] = trans_user_serializer.data[0]

                            return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                        else:
                            return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)

                    ####################################no filter#######################################
                    else:
                        data = json.loads(request.GET.get('data'), strict=False)
                        if ((data['user_name']=='') and (data['start_date']!='') and (data['end_date']!='')):
                            print("no filter")
                            orders = OrderTrn.objects.all().count()
                            trans = OrderTrn.objects.all().order_by('-transaction_time')
                            if trans:

                                transerializer = OrderTrnSerializer(trans,many=True)
                                trans = transerializer.data
                                for ii in trans:
                                    ii['transaction_time'] = ii['transaction_time'][:10]
                                    ii['refund_time'] = ii['refund_time'][:10]
                                    ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                                for index,data in enumerate(trans):
                                    trans_user = User.objects.filter(id=data['user'])
                                    if trans_user:
                                        trans_user_serializer = UserSerializer(trans_user,many=True)
                                        trans[index]['user'] = trans_user_serializer.data[0]

                                return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                                
                            else:
                                return Response({"message" : "Response Send Succesfully","status" : "1","response":[],}, status=status.HTTP_200_OK)



            except:
                data = json.loads(request.GET.get('data'), strict=False)
                if ((data['user_name']=='') and (data['start_date']!='') and (data['end_date']!='')):
                    print("else chle")
                    orders = OrderTrn.objects.all().count()
                    trans = OrderTrn.objects.all().order_by('-transaction_time')
                    if trans:

                        transerializer = OrderTrnSerializer(trans,many=True)
                        trans = transerializer.data
                        for ii in trans:
                            ii['transaction_time'] = ii['transaction_time'][:10]
                            ii['refund_time'] = ii['refund_time'][:10]
                            ii['service_tax'] = round(float(ii['total_amount']) *(.10),2)
                        for index,data in enumerate(trans):
                            trans_user = User.objects.filter(id=data['user'])
                            if trans_user:
                                trans_user_serializer = UserSerializer(trans_user,many=True)
                                trans[index]['user'] = trans_user_serializer.data[0]

                        return Response({"message" : "Response Send Succesfully","status" : "1","response":trans,'count':transerializer.data.__len__()}, status=status.HTTP_200_OK)
                        
                    else:
                        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#######################################################################################
#                            get_order_detail
#######################################################################################

@api_view(['GET'])
def Ord_Detail(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            orders = OrderPost.objects.all().count()
            ord_det = OrderPost.objects.all().order_by('-created_time')
            

            if ord_det:
                ordserializer = OrderPostSerializer(ord_det,many=True)
                odr = ordserializer.data
                for ii in odr:
                    ii['created_time'] = ii['created_time'][:10]
                for i in odr:
                    if i['order_status']==1:
                        i['order_status']="Accepted"
                    elif i['order_status']==2:
                        i['order_status']="Rejected"
                    elif i['order_status']==0:
                        i['order_status']="Pending"
                    elif i['order_status']== -1:
                        i['order_status']="Deleted"
                    elif i['order_status']==-2:
                        i['order_status']="Cancelled"
                    odr_post_image = PostImage.objects.filter(id=i['post_images']).values("post_images")
                    for i1 in odr_post_image:
                        i['post_images'] = i1['post_images']
                    odr_user = User.objects.filter(id=i['user']).values("username")
                    for i1 in odr_user:
                        i['user'] = i1['username']

                    odr_post_price = Post.objects.filter(id=i['post']).values("price")
                    for i1 in odr_post_price:
                        i['price'] = i1['price']
                    odr_post = Post.objects.filter(id=i['post']).values("post_description")
                    for i1 in odr_post:
                        i['post'] = i1['post_description'][:30]
                    
                    odr_size = Size.objects.filter(id=i['size']).values("size")
                    for i1 in odr_size:
                        i['size'] = i1['size']
                   

                
                        
            # #######################add post####################
            #     for index, data in enumerate(odr):
            #         ordr_post = Post.objects.filter(id=data['post'])
            #         print(ordr_post)
            #         if ordr_post:
            #             order_post_serializer = PostSerializer(ordr_post)
            #             odr[index]['post'] = order_post_serializer.data
            # ########################add user##############################
            #     for index,data in enumerate(odr):
            #         pst_rpt_user = User.objects.filter(id=data['user'])
            #         if pst_rpt_user:
            #             pst_rpt_serializer_u = UserSerializer(pst_rpt_user,many=True)
            #             odr[index]['user'] = pst_rpt_serializer_u.data[0]

            # #####################add size#################################
            #     for index,data in enumerate(odr):
            #         odr_size = Size.objects.filter(id = data['size'])
            #         if odr_size:
            #             odr_size_serializer = SizeSerializer(odr_size,many=True)
            #             odr[index]['size'] = odr_size_serializer.data[0]


                
                return Response({"message" : "Response Send Succesfully","status" : "1","response":odr}, status=status.HTTP_200_OK)
                
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

###############################################################################################
# Notification _list_admin
###############################################################################################
@api_view(['GET'])
def Admin_Notified(request):
    try:
        with transaction.atomic():
            try:
                
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                print(token1)
                user = token1.user
                checkGroup = user.groups.filter(name = 'Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"},status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            contact_us = ContactUs.objects.all().order_by('-created_time')
            if contact_us:
                print("kkk")
                lst_data = ContactUsSerializer(contact_us,many=True)
                print("jjj")
                contct = lst_data.data
                for ii in contct:
                    ii['created_time'] = ii['created_time'][:10]
                for index,data in enumerate(contct):
                    cont_user = User.objects.filter(id=data['user'])
                    if cont_user:
                        cont_user_serializer = UserSerializer(cont_user,many=True)
                        contct[index]['user'] = cont_user_serializer.data[0]

            #########################shared post comment########################
            try:
                ids =Post.objects.filter(post_status=1,post_type="promotional")   
                shared_pst = PostComment.objects.filter(status=1,post_id__in=ids).order_by('-created_time')
                print(shared_pst)
                if shared_pst:
                    shared_dta = PostCommentSerializer(shared_pst,many=True)
                    shared_pst = shared_dta.data
                    print(shared_pst,"dekho")
                    for ii in shared_pst:
                        print("hh")
                        ii['created_time'] = ii['created_time'][:10]

                    ######################image
                    for index,data in enumerate(shared_pst):
                        promo_image = PostImage.objects.filter(post_id=data['post'])
                        if promo_image:
                            promo_serial = PostImageSerializer(promo_image, many=True)
                            shared_pst[index]['image'] = promo_serial.data[0]

                    ############add post
                    for index,data in enumerate(shared_pst):
                        shared_rpt = Post.objects.filter(id=data['post'])
                        if shared_rpt:
                            shared_rpt_serializer = PostSerializer(shared_rpt,many=True)
                            shared_pst[index]['post'] = shared_rpt_serializer.data[0]

                    ###########add user
                    for index,data in enumerate(shared_pst):
                        shared_pst_user = User.objects.filter(id=data['user'])
                        if shared_pst_user:
                            shared_pst_serializer_u = UserSerializer(shared_pst_user,many=True)
                            shared_pst[index]['user'] = shared_pst_serializer_u.data[0]
            except:
                shared_pst =[]

            ##################disabled post #############################
            try:
                disabled_pst = ReportPost.objects.filter(status=0).order_by('-created_time')
                if disabled_pst:
                    disable_dta = ReportPostSerializer(disabled_pst,many=True)
                    if disable_dta:
                        disable_pst = disable_dta.data
                        for ii in disable_pst:
                            ii['created_time'] = ii['created_time'][:10]
                    ############add post
                        for index,data in enumerate(disable_pst):
                            disable_rpt = Post.objects.filter(id=data['post'])
                            if disable_rpt:
                                disable_rpt_serializer = PostSerializer(disable_rpt,many=True)
                                disable_pst[index]['post'] = disable_rpt_serializer.data[0]
                                disable_pst[index]['post']['created_time'] = disable_pst[index]['post']['created_time'][:10]
                                disable_pst[index]['post']['post_description'] = disable_pst[index]['post']['post_description'][:30]

                    ###########add user
                        for index,data in enumerate(disable_pst):
                            disable_pst_user = User.objects.filter(id=data['user'])
                            if disable_pst_user:
                                disable_rpt_serializer_u = UserSerializer(disable_pst_user,many=True)
                                disable_pst[index]['user'] = disable_rpt_serializer_u.data[0]
                else:
                   disable_pst =[]
            except:
                disable_pst =[]


            ###############reported post###################
            try:
                report_pst = ReportPost.objects.filter(status=1).order_by('-created_time')
                if report_pst:
                    pst_dta = ReportPostSerializer(report_pst,many=True)
                    pst = pst_dta.data
                    for ii in pst:
                        ii['created_time'] = ii['created_time'][:10]
                    ######################image
                    for index,data in enumerate(pst):
                        promo_image = PostImage.objects.filter(post_id=data['post'])
                        if promo_image:
                            promo_serial = PostImageSerializer(promo_image, many=True)
                            pst[index]['image'] = promo_serial.data[0]
                    ############add post
                    for index,data in enumerate(pst):
                        pst_rpt = Post.objects.filter(id=data['post'])
                        if pst_rpt:
                            pst_rpt_serializer = PostSerializer(pst_rpt,many=True)
                            pst[index]['post'] = pst_rpt_serializer.data[0]
                            pst[index]['post']['created_time'] = pst[index]['post']['created_time'][:10]
                            pst[index]['post']['post_description'] = pst[index]['post']['post_description'][:30]

                    ###########add user
                    for index,data in enumerate(pst):
                        pst_rpt_user = User.objects.filter(id=data['user'])
                        if pst_rpt_user:
                            pst_rpt_serializer_u = UserSerializer(pst_rpt_user,many=True)
                            pst[index]['user'] = pst_rpt_serializer_u.data[0]


                return Response({"message" : "Response Send Successfully","status" : "1","support":contct,"report":pst,"disable_post":disable_pst,"shared_post_comment":shared_pst},status=status.HTTP_200_OK)
            except:
                return Response({"message" : "Response Send Successfully","status" : "1","support":contct,"report":[],"disable_post":disable_pst,"shared_post_comment":shared_pst},status=status.HTTP_200_OK)

    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#####################################################################################
#                     Disable post by admin
#####################################################################################

@api_view(['POST'])
def DisablePostByAdmin(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            post = Post.objects.get(id=post_id,post_status =1)
            print(post.user_id)
            user1 = User.objects.get(id =post.user_id)
            if post:
                post1 = Post.objects.filter(id = post.id,user_id=post.user_id).update(post_status=0)
                p=ReportPost.objects.filter(post_id=post_id).update(status=0)
                print(p)
                if post1:
                    post_count = user1.post_count
                    User.objects.filter(id = post.user_id).update(post_count = post_count-1)
                    notify = SenddisableNotification(post.user_id,"post disabled","Admin disabled your post","post disabled",post.id)
                    return Response({"message" : deletePostSuccessMessage, "status" : "1"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

import requests
########################################################################################################
#                              send disable notification  
########################################################################################################
def SenddisableNotification(receiverId,title,message,tag,post_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiverId)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = message
        if idsArray_ios.__len__() > 0:
            
            data_message = {
                "message_title": title,
                "message_body": message,
                "tag":tag,
                "post_id": post_id,
           }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound ="default",message_body=message_body, data_message=data_message)
            print(result,"1111111111111111")
    except Exception as e:
        return False

#####################################################################################
#                     enable post by admin
#####################################################################################

@api_view(['POST'])
def enablePostByAdmin(request):
    try:
        with transaction.atomic():
            received_json_data = json.loads(request.body, strict=False)
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            post_id = received_json_data['post_id']
            post = Post.objects.get(id=post_id,post_status =0)
            print(post.user_id)
            user1 = User.objects.get(id =post.user_id)
            if post:
                post1 = Post.objects.filter(id = post.id,user_id=post.user_id).update(post_status=1)
                p=ReportPost.objects.filter(post_id=post_id).update(status=1)
                print(p)
                if post1:
                    post_count = user1.post_count
                    User.objects.filter(id = post.user_id).update(post_count = post_count+1)
                    notify = SendenableNotification(post.user_id,"post enabled","Admin enableded your post","post enableded",post.id)
                    return Response({"message" : deletePostSuccessMessage, "status" : "1"}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

import requests
########################################################################################################
#                              send enable notification  
########################################################################################################
def SendenableNotification(receiverId,title,message,tag,post_id):
    try:
        push_service = FCMNotification(api_key="AAAAVQB1c9E:APA91bGcmaXhcyevDS9XKCF3lATdSoxMPqNoIZIDO8o34VCjV-Aj5hiAW1M5CwtBBeBVm1IsUVpQBtVLWTAG6isdVfxzGdMAFFHKzee7X72uYqWbeppdcAQbt0g9FrWhrbld4ZROgoeY")
        idsArray_ios = []
        receiver = User.objects.get(id=receiverId)
        idsArray_ios.append(receiver.deviceId)
        registration_ids_ios = idsArray_ios
        message_title = title
        message_body = message
        if idsArray_ios.__len__() > 0:
            
            data_message = {
                "message_title": title,
                "message_body": message,
                "tag":tag,
                "post_id": post_id,
           }
            result = push_service.notify_multiple_devices(registration_ids=registration_ids_ios, message_title=title,sound ="default",message_body=message_body, data_message=data_message)
            print(result,"1111111111111111")
    except Exception as e:
        return False

#####################################################################################
#                     get users payable by admin
#####################################################################################

@api_view(['GET'])
def GetUsersForPayment(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            paymentss = DuePayment.objects.filter(payment_status =1).order_by('-created_time')
            try:
                paymentserializer = DuePaymentSerializer(paymentss,many=True)  

                pay = paymentserializer.data
                for index,data in enumerate(pay):
                    user_bank = BankDetail.objects.filter(user_id=data['user'])
                    if user_bank:
                        bnk_serial = BankDetailSerializer(user_bank,many=True)
                        pay[index]['bank_detail'] = bnk_serial.data[0]

                for index,data in enumerate(pay):
                    pay_user = User.objects.filter(id=data['user'])
                    if pay_user:
                        pay_serializer_u = UserSerializer(pay_user,many=True)
                        pay[index]['user'] = pay_serializer_u.data[0]

                return Response({"message" : "Response Send Succesfully","status" : "1","response":pay}, status=status.HTTP_200_OK)      
            except:
                return Response({"message" : "Response Send Succesfully","status" : "1","response":[]}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



#####################################################################################
#                     get history of payment
#####################################################################################

@api_view(['GET'])
def PaymentHistory(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)

            paymentss = DuePayment.objects.filter(payment_status =0).order_by('-transaction_time')
            try:
                paymentserializer = DuePaymentSerializer(paymentss,many=True)  

                pay = paymentserializer.data
                print(pay)

                for index,data in enumerate(pay):
                    user_bank = BankDetail.objects.filter(user_id=data['user'])
                    if user_bank:
                        bnk_serial = BankDetailSerializer(user_bank,many=True)
                        pay[index]['bank_detail'] = bnk_serial.data[0]



                for index,data in enumerate(pay):
                    pay_user = User.objects.filter(id=data['user'])
                    if pay_user:
                        pay_serializer_u = UserSerializer(pay_user,many=True)
                        pay[index]['user'] = pay_serializer_u.data[0]
                

                return Response({"message" : "Response Send Succesfully","status" : "1","response":pay}, status=status.HTTP_200_OK)      
            except:
                return Response({"message" : "Response Send Succesfully","status" : "1","response":[]}, status=status.HTTP_200_OK)
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


############################################################################################################
#                            Add promotional post by
############################################################################################################

@api_view(['POST'])
def add_promotonal_post(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            nowTime = datetime.datetime.utcnow().replace(tzinfo=utc)

            post = Post.objects.create(post_description = request.data['post_description'],
                                        user_id = user.id,
                                        created_time = nowTime,
                                        post_status = 1,
                                        post_type = "promotional")
        
            if post is not None:

                return Response({"message" : addPostSuccessMessage, "status" : "1","post":PostSerializer(post).data['id']}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

############################################################################################################
#                            Delete promotional post by admin
############################################################################################################

@api_view(['POST'])
def delete_promotonal_post(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            postId=request.data['id']
            del_post = Post.objects.filter(id = postId,post_status=1).exists()
        
            if del_post:
                dele=Post.objects.filter(id = postId).update(post_status = 0)
                if dele:
                    PostImage.objects.filter(post_id=postId).delete()
                return Response({"message" : deleteSuccessMessage, "status" : "1"}, status=status.HTTP_201_CREATED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



###############################################################################################################################
#            get promotionalpost history                                   
###############################################################################################################################
@api_view(['GET'])
def Get_promo_History(request):
    try:
        with transaction.atomic():
            try:
                
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)


            try:
                promo_posts = Post.objects.filter(post_type="promotional",post_status=1)
                if promo_posts:
                    promo_serializer = PostSerializer(promo_posts,many=True)
                    promo = promo_serializer.data
                    for i1 in promo:
                        i1['post_description'] = i1['post_description'][:30]
                        i1['created_time'] = i1['created_time'][:10]
                    for index, data in  enumerate(promo):
                        print(data['id'])
                        promo_image = PostImage.objects.filter(post_id=data['id'])
                        if promo_image:
                            promo_serial = PostImageSerializer(promo_image, many=True)
                            promo[index]['image'] = promo_serial.data[0]
                    
                return Response({"message" : "Response Send Succesfully","status" : "1","response":promo}, status=status.HTTP_200_OK)
            except:
                return Response({"message" : "Response Send Succesfully","status" : "1","response":[]}, status=status.HTTP_200_OK)
            
                
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

############################################################################################################
#                            Clear Due Payment by admin
############################################################################################################

@api_view(['POST'])
def clear_due_payment(request):
    try:
        with transaction.atomic():
            try:
                API_key = request.META.get('HTTP_AUTHORIZATION')
                token1 = Token.objects.get(key=API_key)
                user = token1.user
                checkGroup = user.groups.filter(name='Admin').exists()
                if checkGroup == False:
                    return Response({"message" : errorMessageUnauthorised, "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
            except:
                return Response({"message": errorMessageUnauthorised, "status": "0"},status=status.HTTP_401_UNAUTHORIZED)
            dueId=request.data['id']
            nowTime = datetime.datetime.now()
            del_due = DuePayment.objects.filter(id = dueId,payment_status=1).exists()
        
            if del_due:
                dele=DuePayment.objects.filter(id = dueId).update(payment_status = 0,transaction_time = nowTime)
                return Response({"message" : deleteSuccessMessage, "status" : "1"}, status=status.HTTP_201_CREATED)
            else:
                return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)          
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

####################################################################
#          apis to add custom data for custom module
###################################################################

#======================================
# api for  add pattern
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Add_Patterns(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        pattern = request.data['pattern']
                        price = request.data['price']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("patternimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        patt = Pattern.objects.create(pattern = pattern,
                                                        image = uploaded_file_url,
                                                        status = 1,
                                                        price = price)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#======================================
# api for  add shapes
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Add_Shapes(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        shape = request.data['shape']
                        price = request.data['price']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("shapesimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        shp = Shape.objects.create(shape = shape,
                                                        image = uploaded_file_url,
                                                        status = 1,
                                                        price = price)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)





#======================================
# api for  add cloth style
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Add_Cloth_Style(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        style_name = request.data['style_name']
                        price = request.data['price']
                            
                        shp = ClothStyle.objects.create(style_name = style_name,
                                                        status = 1,
                                                        price = price)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#======================================
# api for  add cloth style colour
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Add_Cloth_Style_colour(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        colour = request.data['colour']
                        colour_code = request.data['colour_code']
                        cloth_style = request.data['cloth_style']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("clothstylecolourimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        shp = ClothStyleColour.objects.create(colour = colour,
                                                        colour_code = colour_code,
                                                        status = 1,
                                                        cloth_style_id = cloth_style,
                                                        image = uploaded_file_url)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#=============================================
# api for  add cloth style colour Images
#=============================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Add_Cloth_Style_colour_Images(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        colour = request.data['colour']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("clothstylecolourimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        shp = ClothStyleColourImage.objects.create(colour_id = colour,
                                                        status = 1,
                                                        image = uploaded_file_url)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#======================================
# api for shape colour
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Shape_Colour(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        colour = request.data['colour']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("shapecolourimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        shp = ShapeColour.objects.create(colour = colour,
                                                        image = uploaded_file_url)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#======================================
# api for sew
#======================================
@AppVersion_required
@csrf_exempt
@api_view(['PUT'])
def Seww(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        sew_name = request.data['sew_name']
                            
                        shp = Sew.objects.create(sew_name = sew_name)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)




#######################################################
#     api to add pattern colour images t-shirts
#######################################################


@api_view(['POST'])
def Add_Pattern_Colour_Tshirt(request):
    try:
        with transaction.atomic():
            API_Key = request.META.get('HTTP_AUTHORIZATION')
            if API_Key is not None:
                try:
                    token = Token.objects.get(key=API_Key)
                    user = token.user
                    print(user)
                    checkGroup = user.groups.filter(name='Admin').exists()
                    print(checkGroup)
                except Exception as e1:
                    return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)

                if checkGroup:
                    
                    file = request.FILES.get('image')
                    imageUrl = ""
                    if file is not None:
                        fs = FileSystemStorage()
                        filename = fs.save("patterncolourTshirtimages/"+str(user.id)+"/"+file.name, file)
                        uploaded_file_url = fs.url(filename)

                    shp = ClothStylePatternColourImage.objects.create(colour_id = request.data['colour'],
                                                    cloth_style_id = request.data['cloth_style'],
                                                    pattern_id = request.data['pattern'],
                                                    image = uploaded_file_url)
                    return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)

                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#######################################################
#     api update fabric
#######################################################


@api_view(['POST'])
def Update_Fabric(request):
    try:
        with transaction.atomic():
            API_Key = request.META.get('HTTP_AUTHORIZATION')
            if API_Key is not None:
                try:
                    token = Token.objects.get(key=API_Key)
                    user = token.user
                    print(user)
                    checkGroup = user.groups.filter(name='Admin').exists()
                    print(checkGroup)
                    fabricId = request.data['fabric_id']
                except Exception as e1:
                    return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)

                if checkGroup:
                    
                    file = request.FILES.get('image')
                    imageUrl = ""
                    if file is not None:
                        fs = FileSystemStorage()
                        filename = fs.save("fabricimages/"+str(user.id)+"/"+file.name, file)
                        uploaded_file_url = fs.url(filename)

                    shp = Fabric.objects.filter(id=fabricId).update(image = uploaded_file_url)
                    return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)

                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)





########################################################################
#                     update add_fabric_colour
########################################################################

@csrf_exempt
@api_view(['PUT'])
def Add_fabric_colour(request):
    try:
        with transaction.atomic():
            API_key = request.META.get('HTTP_AUTHORIZATION')
            if API_key is not None:
                try:
                    token = Token.objects.get(key=API_key)
                    user = token.user
                    checkGroup = user.groups.filter(name='Admin').exists()
                except Exception as e1:
                        return Response({"message" : "Session Expired!! Please Login Again", "status" : "0"}, status=status.HTTP_401_UNAUTHORIZED)
                
                if checkGroup:
                        colour = request.data['colour']
                        fabric = request.data['fabric_id']
                        file = request.FILES.get('image')
                        imageUrl = ""
                        if file is not None:
                            fs = FileSystemStorage()
                            filename = fs.save("fabricimages/"+str(user.id)+"/"+file.name, file)
                            uploaded_file_url = fs.url(filename)
                            
                        shp = FabricColourImage.objects.create(fabriccolour_id = colour,
                                                        image = uploaded_file_url,
                                                        fabric_id = fabric,
                                                        status = 1)
                        return Response({ 'message': addSuccessMessage, "status":"1"}, status=status.HTTP_200_OK)       
                else:
                    return Response({"message" : errorMessage, "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)    
            else:
                return Response({'status': "0", 'message': 'Timezone is missing!'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except Exception as e:
        print(traceback.format_exc())
        return Response({"message" : str(e), "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

