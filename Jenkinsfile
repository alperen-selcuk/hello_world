pipeline {
  agent any
  
  tools {
    maven 'mvn-3.8.4'
  }
  
  stages {
    stage ("scm") {
      steps {
        checkout scm
      }
    }
    stage ("test") {
      steps {
        sh 'mvn clean test'
      }
    }
  }
}
