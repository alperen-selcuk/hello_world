pipeline {
  agent any
  stages {
    stage ("scm") {
      steps {
        checkout scm
      }
    }
    stage ("test") {
      steps {
        tools {
          maven 'mvn-3.8.4'
        }
        sh 'mvn clean test'
      }
    }
  }
}
