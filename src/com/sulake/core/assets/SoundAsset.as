package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_149:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1385:AssetTypeDeclaration;
      
      private var var_906:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
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
         if(param1 is Sound)
         {
            if(this.var_149)
            {
               this.var_149.close();
            }
            this.var_149 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(this.var_149)
            {
               this.var_149.close();
            }
            this.var_149 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(this.var_149)
            {
               this.var_149.close();
            }
            this.var_149 = SoundAsset(param1).var_149;
            return;
         }
      }
      
      public function get content() : Object
      {
         return this.var_149 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            this.var_149 = SoundAsset(param1).var_149;
         }
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
