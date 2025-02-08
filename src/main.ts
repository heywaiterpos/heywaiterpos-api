import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { DocumentBuilder, SwaggerModule } from "@nestjs/swagger";
import * as bodyParser from "body-parser";
import { ConfigService } from "@nestjs/config";

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config: ConfigService = app.get(ConfigService);

  const options = new DocumentBuilder()
    .setTitle("API Documentation")
    .setDescription("API documentation for the project")
    .setVersion("1.0")
    .addBearerAuth(
      { type: "http", scheme: "bearer", bearerFormat: "JWT", in: "header" },
      "jwt",
    )
    .build();

  // the next two lines did the trick
  app.use(bodyParser.json({ limit: "50mb" }));
  app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup("swagger", app, document, {
    swaggerOptions: { defaultModelsExpandDepth: -1 },
  });
  const port: number = config.get<number>("PORT");
  await app.listen(port, () => {
    console.log(
      `[WEB] ${config.get<string>("BASE_URL")}:${config.get<string>(
        "PORT"
      )}/swagger`
    );
  });
}
bootstrap();
