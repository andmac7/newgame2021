#macro view view_camera[0]

camViewWidth = 1920;
camViewHeight = 1080;
camZoomLevel = 1;
camZoomLevelMax = 10;
camZoomLevelDifference = 10;
defaultZoomWidth = camera_get_view_width(view);
defaultZoomHeight = camera_get_view_height(view);
targetInstance = objPlayer;

x = room_width/2;
y = room_height/2;