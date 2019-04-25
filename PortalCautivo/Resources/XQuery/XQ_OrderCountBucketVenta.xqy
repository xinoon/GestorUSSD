xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../../../PrepaidWave/Resources/WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_OrderCountBucketVenta/";


declare function xf:IN_XQ_OrderCountBucketVenta($searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(*) {
   <listaOperacion>
       <operacion_ventas>
          <VOZ>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and (ns0:tipoTrafico) = 'VOZ' ]) }</VOZ>
          <DATOS>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and (ns0:tipoTrafico) = 'DATOS' and (ns0:tecnologia) != 'MUS' and (ns0:tecnologia) != 'TEM']) }</DATOS>
          <SMS>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and (ns0:tipoTrafico) = 'SMS' ]) }</SMS>
          <MUSICA>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and (ns0:tipoTrafico) = 'DATOS' and (ns0:tecnologia) = 'MUS']) }</MUSICA>
          <TEMATICA>{ fn:count($searchBalancesICC_response1/ns0:buckets[ns0:promo = 'N' and (ns0:tipoTrafico) = 'DATOS' and (ns0:tecnologia) = 'TEM']) }</TEMATICA>
       </operacion_ventas>
    </listaOperacion>
};

declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:IN_XQ_OrderCountBucketVenta($searchBalancesICC_response1)