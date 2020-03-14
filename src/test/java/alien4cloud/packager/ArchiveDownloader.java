package alien4cloud.packager;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import alien4cloud.git.RepositoryManager;
import alien4cloud.utils.FileUtil;

/**
 * Utility that downloads the archives we want to package.
 */
public class ArchiveDownloader {

    public static void main(String[] args) throws IOException {
    	Path buildDirectory = Paths.get(args[0]);
    	String username = args.length>1 ? args[1] : null;
    	String password = args.length>2 ? args[2] : null;
        Path gitDirectory = buildDirectory.resolve("git");
        Path zipDirectory = buildDirectory.resolve("archives");

        RepositoryManager.cloneOrCheckout(gitDirectory, "https://github.com/alien4cloud/tosca-normative-types.git", Version.TOSCA_NORMATIVE_TYPES_VERSION, "tosca-normative-types");
        RepositoryManager.cloneOrCheckout(gitDirectory, "https://github.com/alien4cloud/alien4cloud-extended-types.git", Version.EXTENDED_TYPE_VERSION,
                "alien4cloud-extended-types");

        // zip archives
        // FileUtil.zip(from, to);
        FileUtil.zip(gitDirectory.resolve("tosca-normative-types"), zipDirectory.resolve("tosca-normative-types.zip"));
        FileUtil.zip(gitDirectory.resolve("alien4cloud-extended-types/alien-base-types"), zipDirectory.resolve("alien-base-types.zip"));
        FileUtil.zip(gitDirectory.resolve("alien4cloud-extended-types/alien-extended-storage-types"), zipDirectory.resolve("alien-extended-storage-types.zip"));
        FileUtil.zip(gitDirectory.resolve("alien4cloud-extended-types/docker-types"), zipDirectory.resolve("docker-tosca-types.zip"));
        FileUtil.zip(gitDirectory.resolve("alien4cloud-extended-types/alien-premium-storage-types"), zipDirectory.resolve("alien-premium-storage-types.zip"));
    }
}
