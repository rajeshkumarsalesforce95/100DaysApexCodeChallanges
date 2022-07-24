public class queryAggregateResult {
	/*public void queryAggregateResult() {
  try {
    String groupByQuery = 'SELECT Account.Name n, ' +
        'MAX(Amount) max, MIN(Amount) min ' +
        'FROM Opportunity GROUP BY Account.Name';
    QueryResult qr = connection.query(groupByQuery);
    if (qr.getSize() > 0) {
      System.out.println('Query returned ' + 
          qr.getRecords().length +  ' results.'
      );
      for (SObject sObj : qr.getRecords()) {
        AggregateResult result = (AggregateResult) sObj;
        System.out.println('aggResult.Account.Name: ' + 
            result.getField('n')
        );
        System.out.println('aggResult.max: ' + 
            result.getField('max')
        );
        System.out.println('aggResult.min: ' + 
            result.getField('min')
        );
        System.out.println();
      }
    } else {
      System.out.println('No results found.');
    }
    System.out.println('\nQuery successfully executed.');
  } catch (ConnectionException ce) {
    ce.printStackTrace();
  }
}*/
}