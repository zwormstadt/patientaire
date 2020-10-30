(function() {
	
	// Your web app's Firebase configuration
	// For Firebase JS SDK v7.20.0 and later, measurementId is optional
	const config = {
		apiKey: "AIzaSyDCPMZntL4B261DvG-uebqd2UEge6qUmBs",
		authDomain: "sanfordapp.firebaseapp.com",
		databaseURL: "https://sanfordapp.firebaseio.com",
		projectId: "sanfordapp",
		storageBucket: "sanfordapp.appspot.com",
		messagingSenderId: "323352300281",
		appId: "1:323352300281:web:579c1514a770e41cda7028",
		measurementId: "G-L2ML4TXGQK"
	  };
	// Initialize Firebase
	firebase.initializeApp(config);
	
	const q1Obj = document.getElementById('q1');
	const a1Obj = document.getElementById('a1');
	const q2Obj = document.getElementById('q2');
	const a2Obj = document.getElementById('a2');
	const q3Obj = document.getElementById('q3');
	const a3Obj = document.getElementById('a3');
	const q4Obj = document.getElementById('q4');
	const a4Obj = document.getElementById('a4');
	const q5Obj = document.getElementById('q5');
	const a5Obj = document.getElementById('a5');
	
	
	const q1 = firebase.database().ref().child('1').child('question');
	const a1 = firebase.database().ref().child('1').child('answer');
	const q2 = firebase.database().ref().child('2').child('question');
	const a2 = firebase.database().ref().child('2').child('answer');
	const q3 = firebase.database().ref().child('3').child('question');
	const a3 = firebase.database().ref().child('3').child('answer');
	const q4 = firebase.database().ref().child('4').child('question');
	const a4 = firebase.database().ref().child('4').child('answer');
	const q5 = firebase.database().ref().child('5').child('question');
	const a5 = firebase.database().ref().child('5').child('answer');
	
	q1.on('value', snap=> {
		q1Obj.innerText = snap.val();
	});
	a1.on('value', snap=> {
		a1Obj.innerText = snap.val();
	});
	q2.on('value', snap=> {
		q2Obj.innerText = snap.val();
	});
	a2.on('value', snap=> {
		a2Obj.innerText = snap.val();
	});
	q3.on('value', snap=> {
		q3Obj.innerText = snap.val();
	});
	a3.on('value', snap=> {
		a3Obj.innerText = snap.val();
	});
	q4.on('value', snap=> {
		q4Obj.innerText = snap.val();
	});
	a4.on('value', snap=> {
		a4Obj.innerText = snap.val();
	});
	q5.on('value', snap=> {
		q5Obj.innerText = snap.val();
	});
	a5.on('value', snap=> {
		a5Obj.innerText = snap.val();
	});
	
	
	
	
	
}());