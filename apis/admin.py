from django.contrib import admin
from apis.models import * 


admin.site.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('user_name','email')
    list_filter = ("lastUpdated",)

    fieldsets = (
        (('User'), {'fields': ('email','password','fullname','date_of_birth','gender','image','address','about_me','lastUpdated')}),
        (('Permissions'), {'fields': ('is_active','is_staff')}),
    )
# # admin.site.register(Size)
# admin.site.register(Colour)
# admin.site.register(Fabric)
# admin.site.register(Shape)
# admin.site.register(Post)
# # admin.site.register(PostLike)
# admin.site.register(PostComment)
# admin.site.register(ReportPost)
# admin.site.register(RelPostColour)
# admin.site.register(RelPostSize)
# admin.site.register(Order)
# admin.site.register(OrderPost)
# admin.site.register(Cart)
# admin.site.register(Favourite)
# admin.site.register(FollowUser)
# admin.site.register(Addresses)
# admin.site.register(Notification)
# admin.site.register(ContactUs)
# admin.site.register(Message)



