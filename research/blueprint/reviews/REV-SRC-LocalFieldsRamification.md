Verdict: accepted

# Review of SRC-LocalFieldsRamification

Reviewer: Claude Code — cc-39fac3. This agent did not do the source job, which was by cc-7b31c4 in #2835.

Result reviewed: `research/blueprint/sources/SRC-LocalFieldsRamification.result.json`, as it is on `main`.
Batch: `research/blueprint/sources/jobs/SRC-LocalFieldsRamification.json`. It has one restricted book, SERRE-COURSE-ARITHMETIC, with one citation.

## The one citation: README.md line 426 — accepted

The line pins Serre, *A Course in Arithmetic*, II §3, for the `ℚ_2` case of the Layer 1 sharp square threshold. For `K = ℚ_2` (e = 1), the roadmap's own paragraph above the line says it as: `U(K,3) = 1 + 8ℤ_2` consists of squares, while `U(K,2) = 1 + 4ℤ_2` does not, with witness `5`. The worker replaced it with Keith Conrad, *Hensel's Lemma*, Theorem 4.5 and the paragraph after Theorem 4.7.

### What I opened

I downloaded `https://kconrad.math.uconn.edu/blurbs/gradnumthy/hensel.pdf` myself. It is 459665 bytes and 25 pages, with sha256 `3243fe15855aa549d42ed96f476bfd9f5241cdeb8d33f72beee33fd2e6bfdebf`, identical to what the worker recorded. I read pp. 7–8 on rendered page images.

**Theorem 4.5, p. 7.** It reads: "If u ∈ Z₂^× then u is a square in Q₂ if and only if u ≡ 1 mod 8Z₂." The proof is complete in the notes.
- The forward direction squares the units of ℤ/8ℤ.
- The converse applies the strong Hensel's lemma (Theorem 4.1) to X² − u at a = 1, since |f(1)|₂ ≤ 1/8 < 1/4 = |f′(1)|₂². Theorem 4.1 itself is proved twice, in §§5–6 of the same notes.

**The paragraph after the proof of Theorem 4.7, p. 8.** It reads: "Theorem 4.7 is false for p = 2: the criterion for an element of Z₂^× to be a 2-adic square needs modulus 2³, not modulus 2², by Theorem 4.5. For instance, 5 mod 4 is a square but 5 is not a 2-adic square since 5 ≢ 1 mod 8."

### Does it prove what the line pins, in the same generality?

Yes. The line cites the book only "for `ℚ_2`", and both halves of that case are in Theorem 4.5:
- **Containment.** Every u ≡ 1 mod 8 is a square, which gives `1 + 8ℤ_2 ⊆ (ℚ_2ˣ)²`.
- **Failure at depth 2.** The unit 5 lies in `1 + 4ℤ_2` but is not ≡ 1 mod 8, so it is not a square.

The p. 8 paragraph states the sharpness explicitly, with the roadmap's own witness. "Square in Q₂" in Conrad is the same notion as membership in `(Kˣ)²` in the roadmap, and no hypothesis is added or dropped. This is not a near-miss.

I did not open Serre; the book is restricted. So I compared the replacement against what the roadmap line and the paragraph above it state, not against Serre's text.

### Is the replacement line the same mathematics, and does `old` still match?

- On `main`, line 426 of `content/tau-ceti/LocalFieldsRamification/README.md` is exactly the edit's `old`, including its two-space list indent.
- The `new` line changes only the reference before "for `ℚ_2`". The rest is untouched:
  - "Neukirch ANT II §5 in general";
  - the two continuation lines below: "The hypotheses used are that `K/ℚ_2` is finite, for both halves." and the equal-characteristic remark.
- No statement, stage, layer or scope changes.
- The new line no longer matches the SERRE-COURSE-ARITHMETIC pattern `\*A\ Course\ in\ Arithmetic\*`, and it does match the new register pattern `Conrad,? \*Hensel'?s Lemma\*`.

### Is the source legitimately free?

Yes. The PDF is on the author's own page at the University of Connecticut, in his `blurbs/` collection of expository notes, with proofs. It is not a scan site or a course page reposting someone else's book.

### Is it already in the pinned libraries?

No.
- Mathlib at the pin has no 2-adic unit square criterion. Under `NumberTheory/Padics` the only `IsSquare` result is the rational one, via `padicValRat`.
- Tau Ceti at the pin has only the tame case: `unitFiltration_one_le_range_powMonoidHom_of_isUnit` and its relatives in `TauCeti/NumberTheory/LocalField/PowerSubgroup.lean`, which need `n` invertible in `𝒪[K]`. So they say nothing about squares over `ℚ_2`.
- `not_unitFiltration_le_range_powMonoidHom_two`, which the roadmap names, does not exist yet.

A reference is still needed, and a free one now covers it.

### One non-blocking wording note

The new line says "the remark after Theorem 4.7". In the notes that is an unlabelled paragraph, and the next labelled item is **Remark 4.8**, which is about something else: non-unique roots mod pⁿ. A reader who looks for a labelled remark could land on Remark 4.8.
- The result's own locator, "the paragraph after Theorem 4.7 (p. 8)", is the clearer wording.
- The citation still holds as written, because Theorem 4.5 alone gives the sharpness at u = 5.

A later edit could read "the paragraph after the proof of Theorem 4.7". I did not treat this as grounds for rejection.

## Citations marked "kept"

None: the batch has one citation, and it was replaced. I agree that Serre is no longer needed on this roadmap.

## Register additions

The result adds one work, CONRAD-HENSEL:
- kind `notes`, access `free`;
- the URL above;
- the note describes it accurately: the author's own page, 25 pages, with proofs.

It also sets CONRAD-HENSEL as the substitute for SERRE-COURSE-ARITHMETIC, which is what the roadmap line now cites. The register on `main` had no entry for these notes, so there is no duplicate.

I ran `merge` and `apply_edits` from `scripts/merge_source_results.py` on a scratch copy of the register and README, with this result and an accepting review. The outcome:
- the register grows from 254 to 255 works;
- SERRE-COURSE-ARITHMETIC gets substitute CONRAD-HENSEL;
- line 426 is moved and nothing is refused;
- the moved line matches only CONRAD-HENSEL.

### Pipeline note for the maintainer

The result sits at `research/blueprint/sources/SRC-LocalFieldsRamification.result.json`, moved there in #2835 to "the path the queue and the intake checker agree on". But `scripts/merge_source_results.py` on `main` still globs `research/blueprint/sources/results/SRC-*.json`, and looks for the review at `REV-<stem>.md`.

So as things stand, the merge script will not pick this result up, even once this review is merged. The same is true of `SRC-SemisimpleAlgebras.result.json`. This is not a defect in the job; the script or the path needs aligning.

## Checks run

- `python3 scripts/sources.py --check`: exit 0.
- `python3 -m unittest discover -s tests -p 'test_*.py'`: 282 tests, OK. This includes `test_sources`, `test_merge_source_results` and `test_source_issues`.
