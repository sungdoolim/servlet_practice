<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.0.0/dist/tf.min.js"></script>
<!-- script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.6.0/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.6.0/addons/p5.dom.js"></script>
-->
</head>
<body>
 <script>
 
 const values=[];
 for(i=0;i<30;i++){
	 values[i]=i;
 }
 const shape=[2,5,3];
 const data=tf.tensor(values,shape);
 console.log(data.toString())
 
 
 tf.tensor([1, 2, 3, 4]).print(); 
 
 const model=tf.sequential();
 const configHidden={
		 units:4,
		 inputShape:[2],
		 activation:'sigmoid'
 }
 const hidden=tf.layers.dense(configHidden);
 const configOutput={
		 units:3,
		 inputShape:[4],
		 activation:'sigmoid'
 }
 const output=tf.layers.dense(configOutput);
 model.add(hidden);
 model.add(output);
 const sgdOpt=tf.train.sgd(0.1);
 const config={
		 optimizer:sgdOpt,
		 loss:'meanSquaredError'
 }
 model.compile(config);
 
 const xs=tf.tensor2d([
	 [0.25,0.92],
	 [0.12,0.3],
	 [0.4,0.74],
	 [0.1,0.22]
	 ]);
 const ys=tf.tensor2d([
	 [0.1,0.1,0.02],
	 [0.4,0.03,0.22],
	 [0.4,0.74,0.01],
	 [0.1,0.22,0.01]
	 ]);

 
 async function train(){

	 for(i=0;i<100;i++){
		 const config={shuffle:true}
	 const response=await model.fit(xs,ys,config);
	  console.log(response.history.loss[0])
 		}
	 }
 const predic=tf.tensor2d([[0.2,0.3]]);
 train().then(()=>{
 console.log('train complete');
 let outputs=model.predict(predic);
 outputs.print();}
 );

 
 //const xs=tf.tensor2d([
//	 [0.25,0.92],
//	 [0.12,0.3],
//	 [0.4,0.74],
///	 [0.1,0.22]
//	 ]);
 //let ys=model.predict(xs);
 //outputs.print();
    </script>
</body>
</html>
 