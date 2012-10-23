/* Copyright 2012 Malcolm Herring
 *
 * This is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * For a copy of the GNU General Public License, see <http://www.gnu.org/licenses/>.
 */

import java.io.IOException;
import java.io.RandomAccessFile;

public class Gmarine {

	public static void main(String[] args) {
		final byte[] match = new byte[]{'G', 'A', 'R', 'M', 'I', 'N', ' ', 'T', 'R', 'E' };
		int scan;
		long fsize;
		int tiles;
		if (args.length == 1) {
			try {
				RandomAccessFile file = new RandomAccessFile(args[0], "rw");
				fsize = file.length();
				System.out.println("Processing " + fsize + " byte file...");
				scan = tiles = 0;
				while (file.getFilePointer() < fsize) {
					if (file.readByte() == match[scan]) {
						if (++scan == 10) {
							tiles++;
							scan = 0;
							file.seek(file.getFilePointer() + 56);
							file.writeByte(0x04);
							file.writeByte(0x17);
						}
					} else {
						scan = 0;
					}
				}
				System.out.println(tiles + " tiles processed");
				file.close();
			} catch (IOException e) {
				System.out.println("Unable to open " + args[0]);
			}
		} else {
			System.out.println("Usage: java -jar gmarine <path/to/img/file>");
		}
	}

}
