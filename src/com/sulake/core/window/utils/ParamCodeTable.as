package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_163;
         param1["bound_to_parent_rect"] = const_88;
         param1["child_window"] = const_1008;
         param1["embedded_controller"] = const_977;
         param1["resize_to_accommodate_children"] = const_68;
         param1["input_event_processor"] = const_44;
         param1["internal_event_handling"] = const_700;
         param1["mouse_dragging_target"] = const_218;
         param1["mouse_dragging_trigger"] = const_346;
         param1["mouse_scaling_target"] = const_288;
         param1["mouse_scaling_trigger"] = const_488;
         param1["horizontal_mouse_scaling_trigger"] = const_205;
         param1["vertical_mouse_scaling_trigger"] = const_207;
         param1["observe_parent_input_events"] = const_980;
         param1["optimize_region_to_layout_size"] = const_416;
         param1["parent_window"] = const_972;
         param1["relative_horizontal_scale_center"] = const_168;
         param1["relative_horizontal_scale_fixed"] = const_111;
         param1["relative_horizontal_scale_move"] = const_309;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_967;
         param1["relative_scale_fixed"] = const_747;
         param1["relative_scale_move"] = const_870;
         param1["relative_scale_strech"] = const_1000;
         param1["relative_vertical_scale_center"] = const_157;
         param1["relative_vertical_scale_fixed"] = const_132;
         param1["relative_vertical_scale_move"] = const_371;
         param1["relative_vertical_scale_strech"] = const_339;
         param1["on_resize_align_left"] = const_750;
         param1["on_resize_align_right"] = const_408;
         param1["on_resize_align_center"] = const_517;
         param1["on_resize_align_top"] = const_727;
         param1["on_resize_align_bottom"] = const_445;
         param1["on_resize_align_middle"] = const_460;
         param1["on_accommodate_align_left"] = const_1007;
         param1["on_accommodate_align_right"] = const_498;
         param1["on_accommodate_align_center"] = const_757;
         param1["on_accommodate_align_top"] = const_895;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_548;
         param1["route_input_events_to_parent"] = const_411;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_969;
         param1["scalable_with_mouse"] = const_897;
         param1["reflect_horizontal_resize_to_parent"] = WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT;
         param1["reflect_vertical_resize_to_parent"] = const_472;
         param1["reflect_resize_to_parent"] = const_299;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
