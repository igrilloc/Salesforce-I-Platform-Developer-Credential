public class StringArrayTest {

    public static List<String> generateStringArray(Integer N) {
       
        List<String> TestList = new List<String>();
        
        for (Integer i = 0; i < N; i++) {
            TestList.add('Test ' + i);
            System.debug(TestList[i]);
        }
        
        return TestList;
    }
    
}