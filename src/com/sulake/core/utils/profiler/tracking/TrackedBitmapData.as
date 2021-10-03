package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      private static const const_1511:uint = 16777215;
      
      private static var var_463:uint = 0;
      
      private static var var_462:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_373:Object;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         super(param2,param3,param4,param5);
         ++var_463;
         var_462 += param2 * param3 * 4;
         this.var_373 = param1;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_462;
      }
      
      public static function get numInstances() : uint
      {
         return var_463;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_462 -= width * height * 4;
            --var_463;
            super.dispose();
            this._disposed = true;
            this.var_373 = null;
         }
      }
   }
}
