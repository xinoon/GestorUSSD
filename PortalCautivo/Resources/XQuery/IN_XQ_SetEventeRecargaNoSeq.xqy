xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:setEventoRecargaNoSeqDbaInput" location="../WSDLs/setEventoRecargaNoSeqDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/setEventoRecargaNoSeqDba";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SerEventeRecargaNoSeq/";

declare function xf:IN_XQ_SerEventeRecargaNoSeq($NUM_CEL as xs:string,
    $MONTO as xs:string)
    as element(ns0:setEventoRecargaNoSeqDbaInput) {
        <ns0:setEventoRecargaNoSeqDbaInput>
            <ns0:NUM_CEL>{ $NUM_CEL }</ns0:NUM_CEL>
            <ns0:MONTO>{ data($MONTO) }</ns0:MONTO>
            <ns0:CUSTOMER_ID></ns0:CUSTOMER_ID>
        </ns0:setEventoRecargaNoSeqDbaInput>
};

declare variable $NUM_CEL as xs:string external;
declare variable $MONTO as xs:string external;

xf:IN_XQ_SerEventeRecargaNoSeq($NUM_CEL,
    $MONTO)