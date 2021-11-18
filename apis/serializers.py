from django.contrib.auth.models import User

from rest_framework import serializers
from apis.models import *


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
       # fields = ('id','email' ,'user_name','social_id' ,'login_type' ,'cartNo','address' ,'fullname','gender' ,'about_me','stripe_id','date_of_birth' ,
        #'onoffnotification','post_count' ,'total_follower' ,'total_following','created_time','image','phone','adminCardId','role')
        fields =('__all__')

class VerifyLog(serializers.ModelSerializer):

    class Meta:
        models = VerifyLog
        fields = ('id', 'user', 'code', 'codeUsed','created_time')

class SizeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Size
        fields = ('id','size','status')

class ColourSerializer(serializers.ModelSerializer):

    class Meta:
        model = Colour
        fields = ('id','colour','status','colour_code')


class FabricSerializer(serializers.ModelSerializer):

    class Meta:
        model = Fabric
        fields = ('__all__')

class FabricColourSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = FabricColour
        fields =('__all__')

class FabricColourImageSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = FabricColourImage
        fields =('__all__')


class ShapeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Shape
        fields = ('__all__')
class ShapeColourSerializer(serializers.ModelSerializer):

    class Meta:
        model = ShapeColour
        fields = ('__all__')

class ShapeFillColourSerializer(serializers.ModelSerializer):

    class Meta:
        model = ShapeFillColour
        fields = ('__all__')


class PostSerializer(serializers.ModelSerializer):

    class Meta:
        model = Post
        fields=('id','price','post_description','user','total_likes', 'total_comments','post_status', 'created_time','post_type','post_printing_size_front','post_printing_size_back')

class PostImageSerializer(serializers.ModelSerializer):

    class Meta:
        model = PostImage
        fields = ('id','post_images','post')

# class PostLikeSerializer(serializers.ModelSerializer):

    # class Meta:
    #     model = PostLike
    #     fields = ('id','post','user','created_time')

class PostCommentSerializer(serializers.ModelSerializer):

    class Meta:
        model = PostComment
        fields = ('id','post','user','created_time','comment')


class ReportPostSerializer(serializers.ModelSerializer):

    class Meta:
        model = ReportPost  
        fields = ('id','post','user','created_time','reason')

# class RelPostColourSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = RelPostColour
#         fields = ('id','colour','post')

class RelPostSizeSerializer(serializers.ModelSerializer):

    class Meta:
        model = RelPostSize
        fields = ('id', 'size','post')

class RelPostFabricSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostFabric
        fields =('__all__')


class RelPostClothStyleSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostClothStyle
        fields =('__all__')

class ClothStyleSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ClothStyle
        fields =('__all__')


class RelPostClothStyleColourSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostClothStyleColour
        fields =('__all__')

class ClothStyleColourSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ClothStyleColour
        fields =('__all__')

class ClothStyleColourImageSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ClothStyleColourImage
        fields =('__all__')

class ClothStylePatternColourImageSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ClothStylePatternColourImage
        fields =('__all__')



class RelPostPatternSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostPattern
        fields =('__all__')

class PatternSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Pattern
        fields =('__all__')

class RelPostShapeSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostShape
        fields =('__all__')

class RelPostSewSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostSew
        fields =('__all__')




class SewSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Sew
        fields =('__all__')

class RelPostShapeColourSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RelPostShapeColour
        fields =('__all__')

class OrderTrnSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderTrn
        fields = ('id', 'total_amount','address', 'order_status', 'transaction_id','transaction_time','refund_time','refund_transaction_id','user')  

class OrderPostSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderPost
        fields = ('id','post','user','order','order_status','size','post_images','created_time','seller_status','buyer_status')

class CartSerializer(serializers.ModelSerializer):

    class Meta:
        model = Cart
        fields = ('id','post','post_images', 'size','user','created_time')


class FavouriteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Favourite
        fields = ('id','post','user','created_time')

class FollowUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = FollowUser
        fields = ('id','follow_to','follow_by','created_time')

class AddressesSerializer(serializers.ModelSerializer):

    class Meta:
        model = Addresses
        fields = ('id','user','first_name','last_name','phone','address','city','postal_code','created_time')

class NotificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Notification
        fields = ('id','sender','receiver','notification_time','message','is_read','tag', 'table_id','title','order_id')

class MessageSerializer(serializers.ModelSerializer):

    class Meta:
        model = Message
        fields = ('id','sender','receiver','message','is_read','sender_status','receiver_status','created_time')


class ContactUsSerializer(serializers.ModelSerializer):

    class Meta:
        model = ContactUs
        fields = ('__all__')

class DuePaymentSerializer(serializers.ModelSerializer):
    created_time = serializers.DateTimeField(format='%Y-%m-%d ')
    transaction_time = serializers.DateTimeField(format='%Y-%m-%d ')
    class Meta:
        model = DuePayment
        #fields = ('id','name','email','subject','message','user')
        fields = ('__all__')

class BankDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = BankDetail
        #fields = ('id','name','email','subject','message','user')
        fields = ('__all__')

class CustSizeSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustSize
        #fields = ('id','name','email','subject','message','user')
        fields = ('__all__')
