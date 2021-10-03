package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_682:uint;
      
      private var var_99:IUnknown;
      
      private var var_1621:String;
      
      private var var_1288:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1288 = param1;
         this.var_1621 = getQualifiedClassName(this.var_1288);
         this.var_99 = param2;
         this.var_682 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1288;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_99 == null;
      }
      
      public function get references() : uint
      {
         return this.var_682;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_682) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_99;
      }
      
      public function get iis() : String
      {
         return this.var_1621;
      }
      
      public function reserve() : uint
      {
         return ++this.var_682;
      }
      
      public function dispose() : void
      {
         this.var_1288 = null;
         this.var_1621 = null;
         this.var_99 = null;
         this.var_682 = 0;
      }
   }
}
