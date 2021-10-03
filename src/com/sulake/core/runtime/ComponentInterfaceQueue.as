package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1534:IID;
      
      private var var_911:Boolean;
      
      private var var_996:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1534 = param1;
         this.var_996 = new Array();
         this.var_911 = false;
      }
      
      public function get receivers() : Array
      {
         return this.var_996;
      }
      
      public function get identifier() : IID
      {
         return this.var_1534;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_911;
      }
      
      public function dispose() : void
      {
         if(!this.var_911)
         {
            this.var_911 = true;
            this.var_1534 = null;
            while(this.var_996.length > 0)
            {
               this.var_996.pop();
            }
            this.var_996 = null;
         }
      }
   }
}
