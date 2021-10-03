package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.SoundSettingsEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.SetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.parser.sound.SoundSettingsParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.object.HabboSound;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSample;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager
   {
       
      
      private var _roomEngine:IRoomEngine;
      
      private var var_804:TraxSequencer;
      
      private var var_439:Number = 1.0;
      
      private var var_192:IHabboToolbar;
      
      private var var_540:Map;
      
      private var var_539:PlayListController;
      
      private var var_651:Map;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_803:Map;
      
      private var var_805:IHabboNotifications;
      
      private var var_650:int;
      
      private var _connection:IConnection;
      
      private var var_164:IHabboConfigurationManager;
      
      public function HabboSoundManagerFlash10(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_540 = new Map();
         this.var_651 = new Map();
         this.var_803 = new Map();
         super(param1,param2,param3);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         events.addEventListener(TraxSongLoadEvent.const_1027,this.onTraxLoadComplete);
         Logger.log("Sound manager 10 init");
      }
      
      public function set previewVolume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
         this.initPlayListController();
      }
      
      private function updateVolumeSetting(param1:Number) : void
      {
         this.var_439 = param1;
         this.var_539.updateVolume(this.var_439);
         this.setHabboToolbarIconState(param1 > 0);
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_539 == null)
         {
            return;
         }
         this.var_539.checkSongPlayState(_loc2_.id);
      }
      
      override public function dispose() : void
      {
         this._connection = null;
         if(this.var_539)
         {
            this.var_539.dispose();
            this.var_539 = null;
         }
         if(this.var_651)
         {
            this.var_651.dispose();
            this.var_651 = null;
         }
         if(this.var_803)
         {
            this.var_803.dispose();
            this.var_803 = null;
         }
         if(this.var_540)
         {
            this.var_540.dispose();
            this.var_540 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_164)
         {
            this.var_164.release(new IIDHabboConfigurationManager());
            this.var_164 = null;
         }
         if(this._roomEngine)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_192)
         {
            this.var_192.release(new IIDHabboToolbar());
            this.var_192 = null;
         }
         if(this.var_805)
         {
            this.var_805.release(new IIDHabboNotifications());
            this.var_805 = null;
         }
         super.dispose();
      }
      
      public function get volume() : Number
      {
         return this.var_439;
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc2_:SoundSettingsEvent = param1 as SoundSettingsEvent;
         var _loc3_:SoundSettingsParser = _loc2_.getParser() as SoundSettingsParser;
         if(_loc3_.volume == 1 || _loc3_.volume == 0)
         {
            this.updateVolumeSetting(_loc3_.volume * 1);
         }
         else
         {
            this.updateVolumeSetting(_loc3_.volume / 100);
         }
      }
      
      private function loadSample(param1:int) : void
      {
         if(this.var_164 == null)
         {
            return;
         }
         var _loc2_:String = this.var_164.getKey("flash.dynamic.download.url","furniture/");
         _loc2_ += this.var_164.getKey("flash.dynamic.download.samples.template","mp3/sound_machine_sample_%typeid%.mp3");
         _loc2_ = _loc2_.replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener(Event.COMPLETE,this.onSampleLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         _loc4_.load(_loc3_);
         this.var_540.add(_loc4_,param1);
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(this.var_805 == null)
         {
            return;
         }
         this.var_805.addSongPlayingNotification(param1,param2);
      }
      
      public function set volume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
         this.storeVolumeSetting();
      }
      
      public function playSound(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:HabboSound = this.var_803.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "";
            switch(param1)
            {
               case HabboSoundTypesEnum.const_921:
                  _loc3_ = "sound_call_for_help";
                  break;
               case HabboSoundTypesEnum.const_1463:
                  _loc3_ = "sound_guide_received_invitation";
                  break;
               case HabboSoundTypesEnum.const_1368:
                  _loc3_ = "sound_console_new_message";
                  break;
               case HabboSoundTypesEnum.const_1316:
                  _loc3_ = "sound_message_sent";
                  break;
               case HabboSoundTypesEnum.const_1047:
                  _loc3_ = "sound_catalogue_pixels";
                  break;
               case HabboSoundTypesEnum.const_1024:
                  _loc3_ = "sound_catalogue_cash";
                  break;
               case HabboSoundTypesEnum.const_1259:
                  _loc3_ = "sound_respect_received";
                  break;
               default:
                  Logger.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
            }
            _loc4_ = assets.getAssetByName(_loc3_);
            _loc5_ = _loc4_.content as Sound;
            if(_loc5_ == null)
            {
               return;
            }
            _loc2_ = new HabboSound(_loc5_);
            this.var_803.add(param1,_loc2_);
         }
         _loc2_.volume = this.var_439;
         _loc2_.play();
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._roomEngine = IRoomEngine(param2);
         this.initPlayListController();
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:int = this.var_540.getValue(_loc2_);
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:Number = _loc2_.length;
         _loc2_.extract(_loc4_,int(_loc5_ * 44.1));
         var _loc6_:TraxSample = new TraxSample(_loc4_,_loc3_);
         this.var_540.remove(_loc2_);
         this.var_651.add(_loc3_,_loc6_);
         if(this.var_540.length == 0 && this.var_650 != -1)
         {
            this.var_804.ready = true;
            events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1027,this.var_650));
            this.var_650 = -1;
            this.var_804 = null;
         }
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._communication = IHabboCommunicationManager(param2);
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(this.onConnectionReady);
         if(_loc2_ != null)
         {
            _loc2_.addMessageEvent(new SoundSettingsEvent(this.onSoundSettingsEvent));
            _loc2_.send(new GetSoundSettingsComposer());
            this.onConnectionReady(_loc2_);
            this.initPlayListController();
         }
      }
      
      private function initPlayListController() : void
      {
         if(this.var_164 == null || this._connection == null || this._roomEngine == null || this.var_539 != null)
         {
            return;
         }
         this.var_539 = new PlayListController(this,events,this._roomEngine.events,this._connection);
      }
      
      private function setHabboToolbarIconState(param1:Boolean) : void
      {
         if(this.var_192 == null)
         {
            return;
         }
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_137,HabboToolbarIconEnum.SOUNDS);
         _loc2_.iconState = !!param1 ? "1" : "0";
         this.var_192.events.dispatchEvent(_loc2_);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_805 = IHabboNotifications(param2);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_192 = IHabboToolbar(param2);
         this.var_192.events.addEventListener(HabboToolbarEvent.const_77,this.onHabboToolbarEvent);
         this.var_192.events.addEventListener(HabboToolbarEvent.const_48,this.onHabboToolbarEvent);
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
         events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1350,this.var_650));
         this.var_650 = -1;
         this.var_804 = null;
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this.var_164 = param2 as IHabboConfigurationManager;
         }
      }
      
      public function loadTraxSong(param1:int, param2:String) : IHabboSound
      {
         if(this.var_804 != null)
         {
            return null;
         }
         var _loc3_:TraxData = new TraxData(param2);
         var _loc4_:Array = _loc3_.getSampleIds();
         var _loc5_:* = [];
         var _loc6_:Array = this.var_651.getKeys();
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            if(_loc6_.indexOf(int(_loc4_[_loc7_])) == -1)
            {
               _loc5_.push(int(_loc4_[_loc7_]));
               this.loadSample(int(_loc4_[_loc7_]));
            }
            _loc7_++;
         }
         var _loc8_:TraxSequencer = new TraxSequencer(param1,_loc3_,this.var_651,events);
         _loc8_.volume = this.var_439;
         this.var_804 = null;
         this.var_650 = -1;
         if(_loc5_.length != 0)
         {
            _loc8_.ready = false;
            this.var_804 = _loc8_;
            this.var_650 = param1;
         }
         return _loc8_ as IHabboSound;
      }
      
      public function loadSoundUrl(param1:String) : IHabboSound
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         var _loc3_:Sound = new Sound();
         _loc3_.load(_loc2_);
         var _loc4_:HabboSound = new HabboSound(_loc3_);
         _loc4_.volume = this.var_439;
         return _loc4_ as IHabboSound;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_77)
         {
            this.setHabboToolbarIconState(this.var_439 > 0);
            return;
         }
         if(param1.type == HabboToolbarEvent.const_48)
         {
            if(param1.iconId == HabboToolbarIconEnum.SOUNDS)
            {
               if(this.var_439 == 1)
               {
                  this.updateVolumeSetting(0);
               }
               else
               {
                  this.updateVolumeSetting(1);
               }
               this.storeVolumeSetting();
            }
         }
      }
      
      private function storeVolumeSetting() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new SetSoundSettingsComposer(int(this.var_439 * 100)));
         }
      }
   }
}
