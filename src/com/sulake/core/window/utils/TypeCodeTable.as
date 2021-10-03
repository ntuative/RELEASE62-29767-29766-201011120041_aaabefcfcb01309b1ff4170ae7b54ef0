package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_696;
         param1["bitmap"] = const_775;
         param1["border"] = const_618;
         param1["border_notify"] = const_1392;
         param1["button"] = const_385;
         param1["button_thick"] = const_664;
         param1["button_icon"] = const_1307;
         param1["button_group_left"] = const_761;
         param1["button_group_center"] = const_620;
         param1["button_group_right"] = const_561;
         param1["canvas"] = const_780;
         param1["checkbox"] = const_759;
         param1["closebutton"] = const_1003;
         param1["container"] = const_361;
         param1["container_button"] = const_560;
         param1["display_object_wrapper"] = const_610;
         param1["dropmenu"] = const_463;
         param1["dropmenu_item"] = const_401;
         param1["frame"] = const_369;
         param1["frame_notify"] = const_1249;
         param1["header"] = const_699;
         param1["icon"] = const_868;
         param1["itemgrid"] = const_1026;
         param1["itemgrid_horizontal"] = const_490;
         param1["itemgrid_vertical"] = const_545;
         param1["itemlist"] = const_889;
         param1["itemlist_horizontal"] = const_338;
         param1["itemlist_vertical"] = const_327;
         param1["maximizebox"] = WINDOW_TYPE_MAXIMIZEBOX;
         param1["menu"] = const_1403;
         param1["menu_item"] = const_1221;
         param1["submenu"] = const_902;
         param1["minimizebox"] = const_1377;
         param1["notify"] = const_1239;
         param1["null"] = const_602;
         param1["password"] = const_559;
         param1["radiobutton"] = const_670;
         param1["region"] = const_429;
         param1["restorebox"] = const_1224;
         param1["scaler"] = const_655;
         param1["scaler_horizontal"] = const_1250;
         param1["scaler_vertical"] = const_1306;
         param1["scrollbar_horizontal"] = const_454;
         param1["scrollbar_vertical"] = const_599;
         param1["scrollbar_slider_button_up"] = const_964;
         param1["scrollbar_slider_button_down"] = const_1070;
         param1["scrollbar_slider_button_left"] = const_1066;
         param1["scrollbar_slider_button_right"] = const_951;
         param1["scrollbar_slider_bar_horizontal"] = const_962;
         param1["scrollbar_slider_bar_vertical"] = const_922;
         param1["scrollbar_slider_track_horizontal"] = const_929;
         param1["scrollbar_slider_track_vertical"] = const_891;
         param1["scrollable_itemlist"] = const_1396;
         param1["scrollable_itemlist_vertical"] = const_434;
         param1["scrollable_itemlist_horizontal"] = const_968;
         param1["selector"] = const_767;
         param1["selector_list"] = const_674;
         param1["submenu"] = const_902;
         param1["tab_button"] = const_791;
         param1["tab_container_button"] = const_899;
         param1["tab_context"] = const_310;
         param1["tab_content"] = const_994;
         param1["tab_selector"] = const_754;
         param1["text"] = const_694;
         param1["input"] = const_660;
         param1["toolbar"] = const_1374;
         param1["tooltip"] = const_307;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
