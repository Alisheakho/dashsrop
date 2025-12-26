flutter run --release -d web-server --web-hostname=172.0.0.1 --web-port=3000  --web-renderer html

flutter run -d chrome --web-browser-flag "--disable-web-security"
flutter run -d edge --web-browser-flag "--disable-web-security"
dotnet run --urls="http://localhost:5000;https://localhost:7224"
