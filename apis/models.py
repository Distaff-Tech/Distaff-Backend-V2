from django.db import models
from django.contrib.auth.models import AbstractUser
import datetime
from django.utils.timezone import utc
from django.utils.translation import ugettext, ugettext_lazy as _
import uuid


REPORT_REASON_UNAUTHORIZED_SALE = 'Unauthorized sale'
REPORT_REASON_INAPPROPRIATE_CONTENT = 'Inappropriate content'
REPORT_REASON_THREATENING_VOILENT = 'Threatening or Violent'
REPORT_REASON_OTHER = 'Others'
REPORT_REASON_CHOICES = (
(REPORT_REASON_UNAUTHORIZED_SALE, _('Unauthorized sale')),
(REPORT_REASON_INAPPROPRIATE_CONTENT, _('Inappropriate content')),
(REPORT_REASON_THREATENING_VOILENT, _('Threatening or Violent')),
(REPORT_REASON_OTHER, _('Others'))
)

LOGIN_TYPE_STATUS_I = 'i'
LOGIN_TYPE_STATUS_F = 'f'
LOGIN_TYPE_STATUS_G = 'g'
LOGIN_TYPE_STATUS_E = 'e'
LOGIN_TYPE_STATUS_AP = 'ap'
LOGIN_TYPE_STATUS_CHOICES = (
(LOGIN_TYPE_STATUS_I, ('i')),
(LOGIN_TYPE_STATUS_F, ('f')),
(LOGIN_TYPE_STATUS_G, ('g')),
(LOGIN_TYPE_STATUS_E, ('e')),
(LOGIN_TYPE_STATUS_AP, ('ap')),
)

ORDER_STATUS_ACCEPTED = 1  
ORDER_STATUS_REJECTED = 2
ORDER_STATUS_PENDING = 0
ORDER_STATUS_DELETED = -1
ORDER_STATUS_CANCEL = -2
ORDER_STATUS_CHOICES = (
    (ORDER_STATUS_ACCEPTED, (1)),
    (ORDER_STATUS_REJECTED, (2)),
    (ORDER_STATUS_PENDING, (0)),
    (ORDER_STATUS_DELETED, (-1)),
    (ORDER_STATUS_CANCEL, (-2)),
)


class User(AbstractUser):

    pass
    id = models.BigAutoField(primary_key = True)
    social_id = models.CharField(max_length=255, default="")
    phone = models.CharField(max_length=20,default="",blank=True)
    login_type = models.CharField(max_length=50,choices=LOGIN_TYPE_STATUS_CHOICES)
    address = models.CharField(max_length=255, default="")
    fullname = models.CharField(max_length=255, default="")
    gender = models.CharField(max_length=6,default="M")
    image = models.CharField(max_length=255,default="")
    about_me = models.CharField(max_length=200,default="")
    stripe_id = models.CharField(max_length=255)
    date_of_birth = models.DateField(null=True)
    onoffnotification = models.IntegerField(default=1)
    total_follower = models.IntegerField(default=0)
    total_following = models.IntegerField(default=0)
    role = models.IntegerField(default=0)
    adminCardId = models.CharField(max_length=255,default="")
    post_count = models.IntegerField(default=0)
    created_time = models.DateTimeField()
    deviceId = models.CharField(max_length=255, default="")
    deviceType = models.CharField(max_length=1, default="a")
    user_name = models.CharField(max_length=30)
    lastUpdated = models.DateTimeField(blank=True,null= True)
    cartNo = models.IntegerField(default=0)
    has_bank_account = models.IntegerField(default=0)
    is_pro_created = models.BooleanField(default=False)
    is_email_sent = models.IntegerField(default=-1)
    is_email_verified = models.IntegerField(default=-1)

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(User, self).save(*args, **kwargs)
    
    class Meta:
        verbose_name = ('auth_user')
        verbose_name_plural = ('auth_users')
        db_table = 'auth_user'


class BankDetail(models.Model):
    id = models.BigAutoField(primary_key=True)
    Account_name = models.CharField(max_length=255, default="")
    Type = models.CharField(max_length=255, default="")
    routing_number = models.CharField(max_length=255,default="")
    acc_number = models.CharField(max_length=255,default="")
    user = models.ForeignKey(User, on_delete=models.CASCADE, null="True")
    
        
    class Meta:
        verbose_name = ('bankdetail')
        verbose_name_plural = ('bankdetails')
        db_table = 'bankdetail'
    

class ForgetPasswordLog(models.Model):
    id = models.CharField(max_length=191, primary_key=True)
    user = models.ForeignKey(User, on_delete=models.PROTECT, null=True)
    code = models.CharField(max_length=191)
    createdTime = models.DateTimeField()
    codeUsed = models.IntegerField(default=0)
    def save(self, *args, **kwargs):
        if not self.id:
            self.createdTime = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(ForgetPasswordLog, self).save(*args, **kwargs)

    class Meta:
        db_table = 'forgetpasswordlog'

class VerifyLog(models.Model):
    id = models.CharField(max_length=255, primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null="True")
    code = models.CharField(max_length=255)
    codeUsed = models.IntegerField(default=0)
    created_time = models.DateTimeField() 
    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(VerifyLog, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('verifylog')
        verbose_name_plural = ('verifylogs')
        db_table = 'verifylog'

class Size(models.Model):
    id = models.BigAutoField(primary_key=True)
    size = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)

    class Meta:
        verbose_name = ('size')
        verbose_name_plural = ('sizes')
        db_table = 'size'

class Colour (models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.CharField(max_length=59, default="")
    colour_code = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)

    class Meta:
        verbose_name = ('colour')
        verbose_name_plural = ('colours')
        db_table = 'colour'

class Fabric(models.Model):
    id = models.BigAutoField(primary_key=True)
    fabric = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)
    image = models.CharField(max_length=255,default="")
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    created_time = models.DateTimeField(null=True)
    class Meta:
        verbose_name = ('fabric')
        verbose_name_plural = ('fabrics')
        db_table = 'fabric'

class FabricColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.CharField(max_length=59, default="")
    colour_code = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)


    class Meta:
        verbose_name = ('fabriccolour')
        verbose_name_plural = ('fabriccolours')
        db_table = 'fabriccolour'

class FabricColourImage(models.Model):
    id = models.BigAutoField(primary_key=True)
    status =  models.BooleanField(default=True)
    image = models.CharField(max_length=255)
    fabric = models.ForeignKey(Fabric,on_delete=models.CASCADE,null=True)
    fabriccolour = models.ForeignKey(FabricColour,on_delete=models.CASCADE,null=True)

    class Meta:
        verbose_name = ('fabriccolourimage')
        verbose_name_plural = ('fabriccolourimages')
        db_table = 'fabriccolourimage'


class Shape(models.Model):
    id = models.BigAutoField(primary_key=True)
    shape = models.CharField(max_length=59, default="")
    image = models.CharField(max_length=255,default="")
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    status =  models.BooleanField(default=True)


    class Meta:
        verbose_name = ('shape')
        verbose_name_plural = ('shapes')
        db_table = 'shape'

class ShapeColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.CharField(max_length=59, default="")
    image = models.CharField(max_length=255)

    class Meta:
        verbose_name = ('shapecolour')
        verbose_name_plural = ('shapecolours')
        db_table = 'shapecolour'

class ShapeFillColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.CharField(max_length=59, default="")
    image = models.CharField(max_length=255)

    class Meta:
        verbose_name = ('shapefillcolour')
        verbose_name_plural = ('shapefillcolours')
        db_table = 'shapefillcolour'

class Pattern(models.Model):
    id = models.BigAutoField(primary_key=True)
    pattern = models.CharField(max_length=59, default="")
    image = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    status =  models.BooleanField(default=True)


    class Meta:
        verbose_name = ('pattern')
        verbose_name_plural = ('patterns')
        db_table = 'pattern'

class Sew(models.Model):
    id = models.BigAutoField(primary_key=True)
    sew_name = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)


    class Meta:
        verbose_name = ('sew')
        verbose_name_plural = ('sews')
        db_table = 'sew'

class CustSize(models.Model):
    id = models.BigAutoField(primary_key=True)
    size = models.CharField(max_length=59, default="")
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)


    class Meta:
        verbose_name = ('custsize')
        verbose_name_plural = ('custsizes')
        db_table = 'custsize'


class Post(models.Model):
    id = models.BigAutoField(primary_key=True)
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    # price = models.IntegerField(null=True, blank=True)
    post_type = models.CharField(max_length=255,default="")
    post_description = models.TextField(default="")
    user = models.ForeignKey(User, on_delete=models.CASCADE, null="True")
    total_likes = models.IntegerField(default=0)
    total_comments = models.IntegerField(default=0)
    post_status = models.IntegerField(default=0)
    post_printing_size_front = models.CharField(max_length=255,default="")
    post_printing_size_back = models.CharField(max_length=255,default="")
    # pattern = models.ForeignKey(Pattern, on_delete=models.CASCADE, null="True")
    # fabric = models.ForeignKey(Fabric, on_delete=models.CASCADE, null="True")
    # sew = models.ForeignKey(Sew, on_delete=models.CASCADE, null="True")
    # shape = models.ForeignKey(Shape, on_delete=models.CASCADE, null="True")
    # shapecolour = models.ForeignKey(ShapeColour, on_delete=models.CASCADE, null="True")
    # clothstyle = models.ForeignKey('ClothStyle', on_delete=models.CASCADE, null="True")
    created_time = models.DateTimeField()
    
    # def save(self, *args, **kwargs):
    #     if not self.id:
    #         self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc).replace(microsecond=0)
    #     super(Post, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('post')
        verbose_name_plural = ('posts')
        db_table = 'post'

class ClothStyle(models.Model):
    id = models.BigAutoField(primary_key=True)
    style_name = models.CharField(max_length=59, default="")
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    front_image = models.CharField(max_length=255,default="")
    back_image = models.CharField(max_length=255,default="")
    status =  models.BooleanField(default=True)


    class Meta:
        verbose_name = ('clothstyle')
        verbose_name_plural = ('clothstyles')
        db_table = 'clothstyle'

class ClothStyleColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.CharField(max_length=59, default="")
    colour_code = models.CharField(max_length=59, default="")
    status =  models.BooleanField(default=True)
    front_image = models.CharField(max_length=255,default="")
    back_image = models.CharField(max_length=255,null=True)
    cloth_style = models.ForeignKey(ClothStyle,on_delete=models.CASCADE,null=True)

    class Meta:
        verbose_name = ('clothstylecolour')
        verbose_name_plural = ('clothstylescolours')
        db_table = 'clothstylecolour'

class ClothStyleColourImage(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.ForeignKey(ClothStyleColour,on_delete=models.CASCADE,null=True)
    status =  models.BooleanField(default=True)
    image = models.CharField(max_length=255)
    cloth_style = models.ForeignKey(ClothStyle,on_delete=models.CASCADE,null=True)

    class Meta:
        verbose_name = ('clothstylecolour')
        verbose_name_plural = ('clothstylescolours')
        db_table = 'clothstylecolourimage'

class ClothStylePatternColourImage(models.Model):
    id = models.BigAutoField(primary_key=True)
    colour = models.ForeignKey(ClothStyleColour,on_delete=models.CASCADE,null=True)
    status =  models.BooleanField(default=True)
    front_image = models.CharField(max_length=255,default="")
    back_image = models.CharField(max_length=255,null=True)
    cloth_style = models.ForeignKey(ClothStyle,on_delete=models.CASCADE,null=True)
    pattern = models.ForeignKey(Pattern,on_delete=models.CASCADE,null=True)

    class Meta:
        verbose_name = ('clothstylepatterncolourimage')
        verbose_name_plural = ('clothstylepatterncolourimages')
        db_table = 'clothstylepatterncolourimage'

class AppVersion(models.Model):
    id = models.BigAutoField(primary_key=True)
    version = models.CharField(max_length=255, default="")
    createTime = models.DateTimeField(null=True)

    class Meta:
        verbose_name = ('appversion')
        verbose_name_plural = ('appversion')
        db_table = 'appversion'


class PostImage(models.Model):
    id = models.BigAutoField(primary_key=True)
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null=True)
    colour = models.ForeignKey(Colour, on_delete = models.CASCADE,null=True)
    post_images = models.CharField(max_length=255)
    created_time = models.DateTimeField()
    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(PostImage, self).save(*args, **kwargs)
    class Meta:
        verbose_name = ('postimage')
        verbose_name_plural = ('postimages')
        db_table = 'postimage'

class PostLike(models.Model):
    id = models.BigAutoField(primary_key=True)
    post = models.ForeignKey(Post, on_delete= models.CASCADE, null="True")
    user = models.ForeignKey(User, on_delete= models.CASCADE, null="True")
    status = models.IntegerField(default=0)
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(PostLike, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('postlike')
        verbose_name_plural = ('postlikes')
        db_table = 'postlike'

class PostComment(models.Model):
    id = models.BigAutoField(primary_key=True)
    post =  models.ForeignKey(Post, on_delete= models.CASCADE, null="True")
    comment = models.TextField(blank=True,null=True)
    user = models.ForeignKey(User, on_delete= models.CASCADE, null="True")
    status = models.IntegerField(default=0)
    created_time = models.DateTimeField()

    # def save(self, *args, **kwargs):
    #     if not self.id:
    #         self.created_time = datetime.datetime.utcnow()#.replace(tzinfo=utc).replace(microsecond=0)
            
    #     super(PostComment, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('postcomment')
        verbose_name_plural = ('postcomments')
        db_table = 'postcomment'

class ReportPost(models.Model):
    id = models.BigAutoField(primary_key=True)
    post=  models.ForeignKey(Post, on_delete=models.CASCADE, null="True")
    user = models.ForeignKey(User, on_delete=models.CASCADE, null="True")
    created_time = models.DateTimeField()
    reason = models.TextField(blank=True,null=True,choices=REPORT_REASON_CHOICES)
    status = models.IntegerField(default=0)
    

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(ReportPost, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('reportpost')
        verbose_name_plural = ('reportposts')
        db_table = 'reportpost'

# class RelPostColour(models.Model):
#     id = models.BigAutoField(primary_key=True)
#     colour = models.ForeignKey(Colour,on_delete=models.CASCADE,null="True")
#     post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

#     class Meta:
#         verbose_name = ('relpostcolour')
#         verbose_name_plural = ('relpostcolour')
#         db_table = 'relpostcolour'

class RelPostSize(models.Model):
    id = models.BigAutoField(primary_key=True)
    size = models.ForeignKey(Size,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostsize')
        verbose_name_plural = ('relpostsize')
        db_table = 'relpostsize'

class RelPostFabric(models.Model):
    id = models.BigAutoField(primary_key=True)
    fabric = models.ForeignKey(Fabric,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostfabric')
        verbose_name_plural = ('relpostfabrics')
        db_table = 'relpostfabric'

class RelPostClothStyle(models.Model):
    id = models.BigAutoField(primary_key=True)
    cloth_style = models.ForeignKey(ClothStyle,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostclothstyle')
        verbose_name_plural = ('relpostclothstyles')
        db_table = 'relpostclothstyle'

class RelPostClothStyleColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    cloth_style_colour = models.ForeignKey(ClothStyleColour,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostclothstylecolour')
        verbose_name_plural = ('relpostclothstylecolours')
        db_table = 'relpostclothstylecolour'

class RelPostPattern(models.Model):
    id = models.BigAutoField(primary_key=True)
    pattern = models.ForeignKey(Pattern,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostpattern')
        verbose_name_plural = ('relpostpatterns')
        db_table = 'relpostpattern'

class RelPostShape(models.Model):
    id = models.BigAutoField(primary_key=True)
    shape = models.ForeignKey(Shape,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostshape')
        verbose_name_plural = ('relpostshapes')
        db_table = 'relpostshape'


class RelPostSew(models.Model):
    id = models.BigAutoField(primary_key=True)
    sew = models.ForeignKey(Sew,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostsew')
        verbose_name_plural = ('relpostsews')
        db_table = 'relpostsew'

class RelPostShapeColour(models.Model):
    id = models.BigAutoField(primary_key=True)
    shape_colour = models.ForeignKey(ShapeColour,on_delete=models.CASCADE,null="True")
    post = models.ForeignKey(Post,on_delete=models.CASCADE,null="True")

    class Meta:
        verbose_name = ('relpostshapecolour')
        verbose_name_plural = ('relpostshapecolours')
        db_table = 'relpostshapecolour'




class Cart(models.Model):
    id = models.BigAutoField(primary_key=True)
    post = models.ForeignKey(Post, on_delete= models.CASCADE, null="True")
    post_images = models.ForeignKey(PostImage, on_delete= models.CASCADE, null="True")
    # colour = models.ForeignKey(Colour, on_delete= models.CASCADE, null="True")
    size = models.ForeignKey(Size, on_delete= models.CASCADE, null="True")
    # quantity = models.IntegerField(default=0)
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    # price = models.IntegerField(null=True, blank=True)
    user = models.ForeignKey(User, on_delete= models.CASCADE, null="True")
    created_time = models.DateTimeField()
    
    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(Cart, self).save(*args, **kwargs)


    class Meta:
        verbose_name = ('cart')
        verbose_name_plural = ('carts')
        db_table = 'cart'

class Favourite(models.Model):
    id = models.BigAutoField(primary_key=True)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, null="True")
    user = models.ForeignKey(User, on_delete = models.CASCADE, null="True")
    status = models.IntegerField(default=1)
    # post_images = models.ForeignKey(PostImage, on_delete = models.CASCADE, null="True")
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(Favourite, self).save(*args, **kwargs)
    class Meta:
        verbose_name = ('favourite')
        verbose_name_plural = ('favourites')
        db_table = 'favourite'

class FollowUser(models.Model):
    id = models.BigAutoField(primary_key=True)
    follow_to = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="followed_to")
    follow_by = models.ForeignKey(User,null=True,blank=True,on_delete=models.CASCADE,related_name="followed_by")
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(FollowUser, self).save(*args, **kwargs)
    class Meta:
        verbose_name = ('follow_user')
        verbose_name_plural = ('follow_users')
        db_table = 'follow_user'

class Addresses(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    address = models.TextField(blank=True,null=True)
    phone = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    postal_code = models.CharField(max_length=255)
    status = models.IntegerField(default=0)
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(Addresses, self).save(*args, **kwargs)
        
    class Meta:
        verbose_name = ('address')
        verbose_name_plural = ('addresses')
        db_table = 'addresses'


class Notification(models.Model):
    
    id = models.CharField(max_length=255, primary_key=True)
    sender = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="notification_sender")
    receiver = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="notification_receiver")
    notification_time = models.DateTimeField()
    message = models.TextField(default='')
    order_id = models.IntegerField(default = 0 )
    is_read = models.BooleanField(default=False)
    tag = models.CharField(max_length=150, blank=True)
    title = models.CharField(max_length=255, default="")
    table_id = models.CharField(max_length=150, blank=True)
        
    class Meta:
        verbose_name = ('notification')
        verbose_name_plural = ('notifications')
        db_table = 'notification'

    def save(self, *args, **kwargs):
        if not self.id:
            self.notification_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(Notification, self).save(*args, **kwargs)
        

class Message(models.Model):
    
    id = models.BigAutoField(primary_key=True)
    sender = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="sender")
    receiver = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name="receiver")
    message = models.TextField(default='')
    is_read = models.BooleanField(default=False)
    sender_status = models.BooleanField(default=True)
    receiver_status = models.BooleanField(default=True)
    created_time = models.DateTimeField()

    class Meta:
        verbose_name = ('message')
        verbose_name_plural = ('messages')
        db_table = 'message'
    # def save(self, *args, **kwargs):
    #     if not self.id:
    #         self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
    #     super(Message, self).save(*args, **kwargs)
    

class ContactUs(models.Model):
    id = models.BigAutoField(primary_key=True)
    fullname = models.CharField(max_length=255, default="")
    email = models.CharField(max_length=255, default="")
    subject = models.CharField(max_length=255, default="")
    message = models.TextField(default="")
    user = models.ForeignKey(User, on_delete= models.CASCADE, null="True")
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(ContactUs, self).save(*args, **kwargs)
        
    class Meta:
        verbose_name = ('contactus')
        verbose_name_plural = ('contactus')
        db_table = 'contact_us'
      

class OrderTrn(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete= models.CASCADE, null=True)
    address   = models.ForeignKey('Addresses', on_delete=models.CASCADE, null=True, blank=True)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    order_status = models.CharField(max_length=255,choices=ORDER_STATUS_CHOICES)
    transaction_id = models.CharField(max_length=255, default="")
    transaction_time = models.DateTimeField()
    refund_transaction_id = models.CharField(max_length=255, default="")
    refund_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)


    def save(self, *args, **kwargs):
        if not self.id:
            self.transaction_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(OrderTrn, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('orderdetail')
        verbose_name_plural = ('orderdetails')
        db_table = 'orderdetail'

class DuePayment(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete= models.CASCADE, null=True)
    amount = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    payment_status = models.IntegerField(default=0)
    transaction_id = models.CharField(max_length=255, default="")
    transaction_time = models.DateTimeField(blank=True, null=True)
    created_time = models.DateTimeField()


    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(DuePayment, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('duepayment')
        verbose_name_plural = ('duepayments')
        db_table = 'duepayment'


class OrderPost(models.Model):
    id = models.BigAutoField(primary_key=True)
    order = models.ForeignKey(OrderTrn, on_delete= models.CASCADE, null="True")
    post = models.ForeignKey(Post, on_delete= models.CASCADE, null="True")
    size = models.ForeignKey(Size, on_delete= models.CASCADE, null="True")
    user = models.ForeignKey(User, on_delete= models.CASCADE, null="True")
    post_images = models.ForeignKey(PostImage, on_delete= models.CASCADE, null="True")
    order_status = models.CharField(max_length=255,blank=True, null=True, choices=ORDER_STATUS_CHOICES)
    price = models.DecimalField(max_digits=9, decimal_places =2,null=True)
    buyer_status = models.CharField(max_length=255,default=0)
    seller_status = models.CharField(max_length=255,default=0)
    # price = models.IntegerField(null=True, blank=True)
    quantity = models.IntegerField(default=1)
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(OrderPost, self).save(*args, **kwargs)

    class Meta:
        verbose_name = ('orderpost')
        verbose_name_plural = ('orderposts')
        db_table = 'orderpost'


class Subscribe(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.CharField(max_length=255, blank=True, null=True)

class ReachUs(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255, default="")
    email = models.CharField(max_length=255, default="")
    subject = models.CharField(max_length=255, default="")
    message = models.TextField(default="")
    phone = models.CharField(max_length=255, null=True)
    created_time = models.DateTimeField()

    def save(self, *args, **kwargs):
        if not self.id:
            self.created_time = datetime.datetime.utcnow().replace(tzinfo=utc)
        super(ReachUs, self).save(*args, **kwargs)
        
    class Meta:
        verbose_name = ('reachus')
        verbose_name_plural = ('reachus')
        db_table = 'reachus'
