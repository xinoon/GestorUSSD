xquery version "2004-draft" encoding "UTF-8";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICCResponse" element="ns0:searchBalancesICC-response" location="../WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/getConsultaSaldoTematico/";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";

declare function xf:obtenerHorasVideo($searchBalancesICCResponse as element(ns0:searchBalancesICC-response))
    as xs:integer? {
        
    hours-from-duration(
        xs:dateTime($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'S' and ns0:promo = 'N' and ns0:tecnologia = 'VID']/ns0:limitDate)
        -
        current-dateTime()
    )
};

declare function xf:obtenerMinutosVideo($searchBalancesICCResponse as element(ns0:searchBalancesICC-response))
    as xs:integer? {
        
    minutes-from-duration(
        xs:dateTime($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'S' and ns0:promo = 'N' and ns0:tecnologia = 'VID']/ns0:limitDate)
        -
        current-dateTime()
    )
};

declare function xf:obtenerHorasMusica($searchBalancesICCResponse as element(ns0:searchBalancesICC-response))
    as xs:integer? {
        
    hours-from-duration(
        xs:dateTime($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'S' and ns0:promo = 'N' and ns0:tecnologia = 'MUS']/ns0:limitDate)
        -
        current-dateTime()
    )
};


declare function xf:obtenerMinutosMusica($searchBalancesICCResponse as element(ns0:searchBalancesICC-response))
    as xs:integer? {
        
    minutes-from-duration(
        xs:dateTime($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'S' and ns0:promo = 'N' and ns0:tecnologia = 'MUS']/ns0:limitDate)
        -
        current-dateTime()
    )
};

declare function xf:getConsultaSaldoTematico($searchBalancesICCResponse as element(ns0:searchBalancesICC-response))
    as element(*) {
    <saldosTematicos>
      <video>
        <horas>
        {  
          if (empty(xf:obtenerHorasVideo($searchBalancesICCResponse)) or (xf:obtenerHorasVideo($searchBalancesICCResponse) < 0)) then (0) 
          else (xf:obtenerHorasVideo($searchBalancesICCResponse))
        }
        </horas>
        <minutos>
        {  
          if (empty(xf:obtenerMinutosVideo($searchBalancesICCResponse)) or (xf:obtenerMinutosVideo($searchBalancesICCResponse) < 0)) then (0) 
          else (xf:obtenerMinutosVideo($searchBalancesICCResponse)) 
        }
        </minutos>
      </video>
      <musica>
        <horas>
        {  
          if (empty(xf:obtenerHorasMusica($searchBalancesICCResponse)) or (xf:obtenerHorasMusica($searchBalancesICCResponse) < 0)) then (0) 
          else (xf:obtenerHorasMusica($searchBalancesICCResponse)) 
        }
        </horas>
        <minutos>
        {  
          if (empty(xf:obtenerMinutosMusica($searchBalancesICCResponse)) or (xf:obtenerMinutosMusica($searchBalancesICCResponse) < 0)) then (0) 
          else (xf:obtenerMinutosMusica($searchBalancesICCResponse))
        }
        </minutos>
      </musica>
      <ilimitada>
      	<whatsapp>
      	{
      		if(empty($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'ILI' and ns0:tecnologia = 'WSP']/ns0:usageLabelRef)) then ('No') else
      		('Si')
      	}
      	</whatsapp>
		<whatsappPromo>
      	{
      		if(empty($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'DATOS' and ns0:tematica = 'ILI' and ns0:tecnologia = 'WSP' and ns0:promo = 'S']/ns0:usageLabelRef)) then ('No') else
      		('Si')
      	}
      	</whatsappPromo>      
		<vozIlimitado>
      	{
      		if(empty($searchBalancesICCResponse/ns0:buckets[ns0:tipoTrafico = 'VOZ' and ns0:tematica = 'ILI']/ns0:usageLabelRef)) then ('No') else
      		('Si')
      	}
      	</vozIlimitado>  
      </ilimitada>
    </saldosTematicos>
};

declare variable $searchBalancesICCResponse as element(ns0:searchBalancesICC-response) external;

xf:getConsultaSaldoTematico($searchBalancesICCResponse)