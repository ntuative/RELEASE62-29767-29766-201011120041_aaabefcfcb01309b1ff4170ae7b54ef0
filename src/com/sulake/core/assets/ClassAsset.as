package com.sulake.core.assets
{
   public class ClassAsset implements IAsset
   {
       
      
      private var var_149:Class;
      
      private var _disposed:Boolean = false;
      
      private var var_1385:AssetTypeDeclaration;
      
      public function ClassAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1385 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return null;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Class)
         {
            this.var_149 = param1 as Class;
         }
      }
      
      public function get content() : Object
      {
         return this.var_149 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is ClassAsset)
         {
            this.var_149 = ClassAsset(param1).var_149;
            return;
         }
         throw new Error("Provided asset should be of type ClassAsset!");
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1385;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_1385 = null;
            this.var_149 = null;
            this._disposed = true;
         }
      }
   }
}
