"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const swagger_1 = require("@nestjs/swagger");
const bodyParser = require("body-parser");
const config_1 = require("@nestjs/config");
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    const config = app.get(config_1.ConfigService);
    const options = new swagger_1.DocumentBuilder()
        .setTitle("API Documentation")
        .setDescription("API documentation for the project")
        .setVersion("1.0")
        .addBearerAuth({ type: "http", scheme: "bearer", bearerFormat: "JWT", in: "header" }, "jwt")
        .build();
    app.use(bodyParser.json({ limit: "50mb" }));
    app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
    const document = swagger_1.SwaggerModule.createDocument(app, options);
    swagger_1.SwaggerModule.setup("swagger", app, document, {
        swaggerOptions: { defaultModelsExpandDepth: -1 },
    });
    const port = config.get("PORT");
    await app.listen(port, () => {
        console.log(`[WEB] ${config.get("BASE_URL")}:${config.get("PORT")}/swagger`);
    });
}
bootstrap();
//# sourceMappingURL=main.js.map