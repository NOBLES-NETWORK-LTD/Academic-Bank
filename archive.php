<?php include 'inc/header.php'; ?>

<!-- Archive Page -->
<div class="container py-5">
    <h2 class="text-center mb-4">📚 Academic Resource Archive</h2>
    <p class="text-center mb-5">Access helpful materials shared by your peers and tutors. All resources are hosted on Google Drive. Click to view or scroll to preview.</p>

    <?php
    $resources = [
        [ //Folder
    'title' => 'English Department - Academic Bank (Folder)',
    'description' => 'Browse multiple past essays and term papers.',
    'drive_folder' => '1ziOzHWegATB9M_po6Lf_YXmkKhvvHwAb' 
    ],
        [ //File
            'title' => 'Demo - Novel Preview',
            'description' => 'Step-by-step project writing manual.',
            'drive_id' => '1VeitLRhp3sHbqPoSHBbqF6mqKr14sYV6' 
        ],
        [ //File
            'title' => 'EPS Textbook',
            'description' => 'Entreprenuership Studies Textbook',
            'drive_id' => '1zboAcVE8MyI5g08_uqGROI2YVoNKzksP' 
        ],
    ];
    ?>

    <div class="row">
<?php foreach ($resources as $file): ?>
    <div class="col-md-6 mb-4">
        <div class="card shadow-sm h-100">
            <div class="card-body">
                <h5 class="card-title"><?= htmlspecialchars($file['title']) ?></h5>
                <p class="card-text"><?= htmlspecialchars($file['description']) ?></p>

                <?php if (isset($file['drive_id'])): ?>
                    <a class="btn btn-outline-primary mb-3" href="https://drive.google.com/file/d/<?= $file['drive_id'] ?>/view" target="_blank">
                        📄 View on Google Drive
                    </a>
                    <div class="ratio ratio-16x9">
                        <iframe
                            src="https://drive.google.com/file/d/<?= $file['drive_id'] ?>/preview"
                            allow="autoplay"
                            class="rounded border"
                            loading="lazy"
                        ></iframe>
                    </div>
                <?php elseif (isset($file['drive_folder'])): ?>
                    <a class="btn btn-outline-success" href="https://drive.google.com/drive/folders/<?= $file['drive_folder'] ?>?usp=sharing" target="_blank">
                        📁 Open Folder
                    </a>
                <?php endif; ?>

            </div>
        </div>
    </div>
<?php endforeach; ?>

    </div>
</div>

<?php include 'inc/footer.php'; ?>

