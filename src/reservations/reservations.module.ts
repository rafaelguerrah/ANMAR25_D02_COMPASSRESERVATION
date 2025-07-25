import { Module } from "@nestjs/common";
import { PrismaModule } from "src/prisma/prisma.module";
import { ReservationController } from "./reservations.controller";
import { ReservationService } from "./reservations.service";
import { ReservationValidationService } from "./reservationsValidate.service";
import { EmailModule } from "src/email/email.module";

@Module({
     imports: [PrismaModule, EmailModule],
     controllers: [ReservationController],
     providers: [ReservationService, ReservationValidationService],
     exports: [ReservationService]
})
export class ReservationModule {

}