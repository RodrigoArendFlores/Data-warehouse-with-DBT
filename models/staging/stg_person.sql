with
     source as (
         select 
    /* Primary key */
      businessentityid
        
     /* Foreign keys */
         
     ,firstname
     ,middlename	
     ,lastname	
     ,persontype	
     ,namestyle	
     ,suffix	
     ,modifieddate	
     ,rowguid	
     ,emailpromotion	
     ,title		

     
     /* */
     ,_sdc_table_version		
     ,_sdc_received_at
     ,_sdc_extracted_at
     ,_sdc_sequence	
     ,_sdc_batched_at as last_etl_run

     from {{ source('adventure_works','person') }}
 )
 select * from source 