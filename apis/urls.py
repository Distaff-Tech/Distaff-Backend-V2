"""DiStaff URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https:docs.djangoproject.comen2.2topicshttpurls
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from apis import views as api_views
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic.base import TemplateView
from django.contrib.auth import views as auth_views
from django.conf.urls import include, url
from django.contrib.auth.forms import PasswordResetForm
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('admin', admin.site.urls),
    path('signup',api_views.SignUp,name = "signup"),
    path('sendverifylink', api_views.SendVerifyLink),
    path('verifymail', api_views.verifymail),
    path('validateuser',api_views.validateuser),
    path('forgot_password',api_views.ForgetPassword),
    path('terms_conditions', api_views.Terms_Conditions),
    path('privacy', api_views.privacy_policy),
    path('cancel', api_views.cancel_policy),
    path('sendnotification', api_views.SendNotification),
    path('update_token', api_views.UpdateDeviceId,name="update_token"),
    path('login',api_views.Applogin,name="applogin"),
    path('social_login',api_views.SocialLogin,name="social_login"),
    path('delete_notification', api_views.DeleteNotification,name="delete_notification"),
    path('create_profile',api_views.CreateProfile,name="create_profile"),
    path('changePassword',api_views.ChangePassword,name="changePassword"),
    path('', include('django.contrib.auth.urls')),
    # path('password_reset', auth_views.PasswordResetView.as_view(template_name = 'registrationpassword_reset_form.html'), name='password_change'),
    # path('password_resetdone', auth_views.PasswordResetDoneView.as_view(template_name = 'registrationpassword_reset_done.html'), name='password_reset_done'),
    # path('passwordchangedone', PasswordChangeDoneView.as_view(), name='password_change_done'),

    path('get_fabric_size',api_views.getFabricSizeColour),
    path('add_address',api_views.addAddress,name="add_address"),
    path('delete_address',api_views.deleteAddress,name="delete_address"),
    path('order_delete', api_views.OrderDelete, name="order_delete"),
    path('get_address',api_views.getAddresses,name="getaddress"),
    path('contactus',api_views.ContactUsEmail,name="contactus"),
    path('logout',api_views.logoutAppUser,name="logout"),
    path('addpost',api_views.addPost,name = "addpost"),
    # path('deletepost',api_views.deletePost,name='delete_post'),
    path('set_favourite',api_views.setFavPost,name="set_favourite"),
    path('get_favourite',api_views.getFavouritePost,name="getfavourite"),
    path('postcomment',api_views.addPostComment,name="postcomment"),
    path('like_dislike_post',api_views.LikedislikePost),
    path('deletecomment',api_views.deletePostComment,name="deletecomment"),
    path('getcomment/<int:pk>',api_views.GetPostComment, name='getcomments'),
    path('send_message', api_views.sendMessage),
    path('get_message', api_views.getMessage),
    path('chat_history', api_views.chatHistory),
    path('delete_message', api_views.deleteMessage),
    path('report_user',api_views.report_post,name="report_post"),
    # path('myprofile',api_views.Myprofile,name='myprofile'),
    path('userprofile/<int:pk>',api_views.Userprofile,name="userprofile"),
    # path('profile/<int:pk>',api_views.profile,name="profile"),

    path('get_post/<int:pk>',api_views.getPost,name='get_post'),
    path('search_user',api_views.searchUser,name='search_user'),
    path('set_follow',api_views.setFollow,name="follow"),
    path('get_followers',api_views.getFollowers,name="get_followers"),
    path('get_following',api_views.getFollowing,name='get_following'),
    path('get_homePage',api_views.getHomePage,name="gethome"),
    path('set_onOffNotification',api_views.SetOnOffNotification,name='set_notification'),
    path('notification_list', api_views.GetNotificationList, name="notification_list"),
    path('addtocart',api_views.AddToCart,name="addtocart"),
    path('get_cart_posts',api_views.ShowCartPosts,name="getcartposts"),
    path('delete_cart_post',api_views.DeletePostFromCart,name="deletepostfromcart"),
    path('admin_signup',api_views.SignUpAdmin),
    path('add_card', api_views.AddCard,name="addcard"),
    path('get_list_cards', api_views.Get_List_Cards,name="get_list_cards"),
    path('delete_card', api_views.DeleteCard,name="Delete_Card"),
    path('order_create', api_views.OrderCreate,name="order_create"),
    path('accept_order', api_views.AcceptRejectOrder),
    path('cancel_order', api_views.CancelOrder),
    path('past_orders', api_views.PastOrders), 
    path('order_detail', api_views.OrderDetail),
    path('my_request', api_views.MyRequest),
    path('subscribe', api_views.SubScribe),
    path('reachusemail', api_views.ReachUsEmail),
    # path('custom_design', api_views.CustomDesign),
    path('getCustomList',api_views.getCustomList, name='getCustomList'),
    path('add_bank',api_views.AddBank, name='AddBank'),

############################################################
#                    admin 
#############################################################

    path('admin_register',api_views.AdminRegister, name='AdminRegister'),
    path('admin_login',api_views.AdminLogin, name='AdminLogin'),
    path('dashboard',api_views.Dashboard, name='Dashboard'),
    path('get_admin_profile',api_views.Get_Admin_Profile, name='Get_Admin_Profile'),
    path('logoutAdmin',api_views.LogutAdminUser, name='LogutAdminUser'),
    path('changeAdminPassword',api_views.Change_Admin_Password, name='Change_Admin_Password'),
    path('editProfile',api_views.EditProfile, name='EditProfile'),
    path('active_u',api_views.Active_Users, name='Active_Users'),
    path('registered_u',api_views.Registered_Users, name='Registered_Users'),
    path('transaction_detail',api_views.Trans_Detail, name='Trans_Detail'),
    path('show_profile',api_views.Show_Profile, name='Show_Profile'),
    path('ord_det',api_views.Ord_Detail, name='Ord_Detail'),
    path('admin_notify',api_views.Admin_Notified, name='Admin_Notified'),
    path('uploadfile',api_views.uploadfile, name='uploadfile'),
    path('showpost',api_views.Show_Post, name='Show_Post'),
    path('disable_post',api_views.DisablePostByAdmin, name='DisablePostByAdmin'),
    path('enable_post',api_views.enablePostByAdmin, name='enablePostByAdmin'),
    path('get_Due_Payment',api_views.GetUsersForPayment, name='GetUsersForPayment'),
    path('add_promotonal_post',api_views.add_promotonal_post, name='add_promotonal_post'),
    path('delete_promotonal_post',api_views.delete_promotonal_post, name='delete_promotonal_post'),
    path('get_promo_history',api_views.Get_promo_History, name='Get_promo_History'),
    path('clear_due_payment',api_views.clear_due_payment, name='clear_due_payment'),
    path('payment_history',api_views.PaymentHistory, name='PaymentHistory'),
    #path('Show_user_info',api_views.Show_user_info, name='Show_user_info'),

    #########################################################
    #             for custum module
    #########################################################
    path('add_pattern',api_views.Add_Patterns, name='Add_Patterns'),
    path('add_shapes',api_views.Add_Shapes, name='Add_Shapes'),
    path('add_cloth_style',api_views.Add_Cloth_Style, name='Add_Cloth_Style'),
    path('add_cloth_style_colour',api_views.Add_Cloth_Style_colour, name='Add_Cloth_Style_colour'),
    path('add_cloth_style_colour_images',api_views.Add_Cloth_Style_colour_Images, name='Add_Cloth_Style_colour_Images'),
    path('shape_colour',api_views.Shape_Colour, name='Shape_Colour'),
    path('seww',api_views.Seww, name='Seww'),




]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
