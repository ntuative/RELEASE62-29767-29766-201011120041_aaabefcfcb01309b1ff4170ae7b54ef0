package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var var_149:XML;
      
      private var _disposed:Boolean = false;
      
      private var var_1385:AssetTypeDeclaration;
      
      private var var_906:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1385 = param1;
         this.var_906 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1385;
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
         return this.var_906;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            this.var_149 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            this.var_149 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            this.var_149 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            this.var_149 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            this.var_149 = XmlAsset(param1).var_149;
            return;
         }
      }
      
      public function get content() : Object
      {
         return this.var_149 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            this.var_149 = XmlAsset(param1).var_149;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_149 = null;
            this.var_1385 = null;
            this.var_906 = null;
         }
      }
   }
}
