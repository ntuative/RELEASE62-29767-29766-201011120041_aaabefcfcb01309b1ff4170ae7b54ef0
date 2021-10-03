package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_871:IAssetLoader;
      
      private var var_1631:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1631 = param1;
         this.var_871 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_871;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_871 != null)
            {
               if(!this.var_871.disposed)
               {
                  this.var_871.dispose();
                  this.var_871 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return this.var_1631;
      }
   }
}
