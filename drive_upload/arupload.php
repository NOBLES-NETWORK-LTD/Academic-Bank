<?php include '../inc/header.php'; 
require __DIR__ . '/vendor/autoload.php';
?>

<div class="container py-5">
    <h2 class="text-center mb-4">📤 Submit to Nobles Archives</h2>
    <p class="text-center text-muted mb-5">Use the form below to submit large files directly to our archive's Submissions folder.</p>

    <form action="process_upload.php" method="post" enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
        <div class="mb-3">
            <label for="file" class="form-label">Choose File (max 50MB)</label>
            <input type="file" name="file" id="file" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">Title of Document</label>
            <input type="text" name="title" id="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="desc" class="form-label">Short Description</label>
            <textarea name="desc" id="desc" class="form-control" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-primary w-100">📤 Upload to Archives</button>
    </form>
</div>

<?php include '../inc/footer.php'; ?>
