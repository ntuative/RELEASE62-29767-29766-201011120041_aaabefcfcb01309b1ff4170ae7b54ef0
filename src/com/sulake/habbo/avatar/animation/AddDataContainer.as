package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1746:String;
      
      private var var_1559:String;
      
      private var var_1084:String;
      
      private var var_667:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_1746 = String(param1.@align);
         this.var_1084 = String(param1.@base);
         this.var_1559 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            this.var_667 = Number(_loc2_);
            if(this.var_667 > 1)
            {
               this.var_667 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return this.var_1746;
      }
      
      public function get ink() : String
      {
         return this.var_1559;
      }
      
      public function get base() : String
      {
         return this.var_1084;
      }
      
      public function get isBlended() : Boolean
      {
         return this.var_667 != 1;
      }
      
      public function get blend() : Number
      {
         return this.var_667;
      }
      
      public function get id() : String
      {
         return this._id;
      }
   }
}
