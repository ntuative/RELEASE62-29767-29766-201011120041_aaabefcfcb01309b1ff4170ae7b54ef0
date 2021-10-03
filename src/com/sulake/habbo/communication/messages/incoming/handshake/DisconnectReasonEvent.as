package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1547:int = 5;
      
      public static const const_1748:int = 113;
      
      public static const const_1559:int = 29;
      
      public static const const_1623:int = 0;
      
      public static const const_1531:int = 102;
      
      public static const const_1556:int = 25;
      
      public static const const_1734:int = 20;
      
      public static const const_1576:int = 116;
      
      public static const const_1533:int = 114;
      
      public static const const_1605:int = 101;
      
      public static const const_1697:int = 108;
      
      public static const const_1699:int = 112;
      
      public static const const_1594:int = 100;
      
      public static const const_1589:int = 24;
      
      public static const const_1282:int = 10;
      
      public static const const_1579:int = 111;
      
      public static const const_1655:int = 23;
      
      public static const const_1738:int = 26;
      
      public static const const_1303:int = 2;
      
      public static const const_1578:int = 22;
      
      public static const const_1571:int = 17;
      
      public static const const_1536:int = 18;
      
      public static const const_1663:int = 3;
      
      public static const const_1526:int = 109;
      
      public static const const_1437:int = 1;
      
      public static const const_1539:int = 103;
      
      public static const const_1639:int = 11;
      
      public static const const_1577:int = 28;
      
      public static const const_1557:int = 104;
      
      public static const const_1690:int = 13;
      
      public static const const_1645:int = 107;
      
      public static const const_1532:int = 27;
      
      public static const const_1704:int = 118;
      
      public static const const_1665:int = 115;
      
      public static const const_1736:int = 16;
      
      public static const const_1681:int = 19;
      
      public static const const_1551:int = 4;
      
      public static const const_1649:int = 105;
      
      public static const const_1564:int = 117;
      
      public static const const_1609:int = 119;
      
      public static const const_1722:int = 106;
      
      public static const const_1584:int = 12;
      
      public static const const_1721:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1437:
            case const_1282:
               return "banned";
            case const_1303:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
