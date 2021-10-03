package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1340:int = 0;
      
      private var var_1392:int = 0;
      
      private var var_1860:String = "";
      
      private var var_1339:int = 0;
      
      private var var_1859:String = "";
      
      private var var_1857:int = 0;
      
      private var var_1737:String = "";
      
      private var var_1856:int = 0;
      
      private var var_1855:int = 0;
      
      private var var_1337:String = "";
      
      private var var_1858:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_1856 = param1;
         this.var_1337 = param2;
         this.var_1737 = param3;
         this.var_1860 = param4;
         this.var_1859 = param5;
         if(param6)
         {
            this.var_1392 = 1;
         }
         else
         {
            this.var_1392 = 0;
         }
         this.var_1857 = param7;
         this.var_1855 = param8;
         this.var_1339 = param9;
         this.var_1858 = param10;
         this.var_1340 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1856,this.var_1337,this.var_1737,this.var_1860,this.var_1859,this.var_1392,this.var_1857,this.var_1855,this.var_1339,this.var_1858,this.var_1340];
      }
      
      public function dispose() : void
      {
      }
   }
}
