use strict;
use Test::More;
use POSIX qw( strftime );

BEGIN {
    eval{ require ACH::Builder; };
    if ( $@ ) {
        plan skip_all => 'ACH::Builder required';
    }
    else {
        plan qw(no_plan);
    }
}

my $ach = ACH::Builder->new(
    {
        destination_name  => 'destname',
        destination       => 'dest',
        company_name      => 'cname',
        entry_description => 'entrydescription',
    }
);

$ach->set_company_note( 'cnote' );
$ach->set_immediate_origin( 'origin' );
$ach->set_immediate_origin_name( 'originname' );
$ach->set_company_id( 'cid' );

is_deeply(
    $ach,
    { 
    '__BATCH_COUNT__'           => 0,
    '__BLOCK_COUNT__'           => 0,
    '__ENTRY_COUNT__'           => 0,
    '__ENTRY_HASH__'            => 0,
    '__DEBIT_AMOUNT__'          => 0,
    '__CREDIT_AMOUNT__'         => 0,
    '__BATCH_TOTAL_DEBIT__'     => 0,
    '__BATCH_TOTAL_CREDIT__'    => 0,
    '__BATCH_ENTRY_COUNT__'     => 0,
    '__BATCH_ENTRY_HASH__'      => 0,
    '__SERVICE_CLASS_CODE__'    => 200,
    '__IMMEDIATE_DEST_NAME__'   => 'destname',
    '__IMMEDIATE_ORIGIN_NAME__' => 'originname',
    '__IMMEDIATE_DEST__'        => 'dest', 
    '__IMMEDIATE_ORIGIN__'      => 'origin',
    '__ENTRY_CLASS_CODE__'      => 'PPD',
    '__ENTRY_DESCRIPTION__'     => 'entrydescription',
    '__COMPANY_ID__'            => 'cid',
    '__COMPANY_NAME__'          => 'cname',
    '__COMPANY_NOTE__'          => 'cnote',
    '__FILE_ID_MODIFIER__'      => 'A',
    '__RECORD_SIZE__'           => 94,
    '__BLOCKING_FACTOR__'       => 10,
    '__FORMAT_CODE__'           => 1,
    '__ACH_DATA__'              => [],
    '__EFFECTIVE_DATE__'        => strftime( "%y%m%d", localtime( time + 86400 ) ),    
    },
    'ACH Builder Object'
);
