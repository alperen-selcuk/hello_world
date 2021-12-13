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
        sh 'mvn clean test'
      }
    }
  }
}
