from django.contrib import admin
from django.urls import path
from hello import views
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]

urlpatterns = [
    path('', views.index, name='index'),
]

