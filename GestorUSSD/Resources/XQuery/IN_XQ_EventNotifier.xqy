xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$ussdOperacion1" element="ns1:ussdOperacion" location="../WSDL/USSDOperaciones.xsd" ::)
(:: pragma bea:global-element-return element="ns0:eventNotifier" location="../WSDL/CONT.0010013.WOM.NEG.CampaignFunnelManagement.CampaignManagementService_2.0.wsdl" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://cm.mobilytix.comviva.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_EventNotifier/";

declare function xf:IN_XQ_EventNotifier($ussdOperacion1 as element(ns1:ussdOperacion), $IdTransaccion as xs:string, $usuario as xs:string,
    $pass as xs:string )
    as element(ns0:eventNotifier) {
        <ns0:eventNotifier>
            <ns0:username>{ $usuario }</ns0:username>
            <ns0:password>{ $pass }</ns0:password>
            <ns0:event>
                <ns0:MSISDN>{ data($ussdOperacion1/nroCelular) }</ns0:MSISDN>
                <ns0:eventNode>USSD</ns0:eventNode>
                <ns0:eventType>ADD_OFFER_EVT</ns0:eventType>
                <ns0:params>
                    <ns0:param>CHANNEL</ns0:param>
                    <ns0:value>USSD</ns0:value>
                </ns0:params>                 <ns0:params>
                    <ns0:param>offerID</ns0:param>
                    <ns0:value>{ data($ussdOperacion1/segmento) }</ns0:value>
                </ns0:params>          
                 <ns0:timeStamp>{ fn:current-dateTime() }</ns0:timeStamp>
                <ns0:transactionID>{ $IdTransaccion }</ns0:transactionID>
            </ns0:event>
        </ns0:eventNotifier>
};

declare variable $ussdOperacion1 as element(ns1:ussdOperacion) external;
declare variable $IdTransaccion as xs:string external;
declare variable $usuario as xs:string external;
declare variable $pass as xs:string external;



xf:IN_XQ_EventNotifier($ussdOperacion1,
    $IdTransaccion,$usuario,$pass)