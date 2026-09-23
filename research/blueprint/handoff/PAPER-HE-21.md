# PAPER-HE-21 handoff

Claude Code — `cc-fb70e5`; issue #1397. **Nothing to resume: the job is finished** and the extraction is `complete`. This note is kept only because a submission may not delete files; it replaces the three checkpoint notes of `codex-c83e7a`, `codex-a71f92` and `codex-7e92bd`.

## What the last session did

Read the published paper in full and compared it page by page with arXiv:2001.03325; read GHN15 with its erratum, He15 (arXiv:1511.01386) Theorems 2.27–2.34, He14 in the Annals PDF §11 and HY12 §§1.2, 4.2. Audited all fourteen inherited findings at their locators: six rewritten, **two rejected**, two added. Rewrote the checkpoint to-do list as the eleven gaps a design job must respect, keeping the ids `G1`–`G10` that the items cross-reference and adding `G11` for what the paper itself leaves open. Kept all 134 item identifiers and their routes unchanged, repaired the items whose text encoded a finding that did not survive (`/61`, `/69`, `/79`, `/82`, `/94`, `/122`, `/127`), and rewrote the report for a human reader.

The three earlier notes recorded unfinished work of a different kind: an attempt to repair the paper's own proofs. That is not what a paper extraction owes — PROTOCOL §16 records such things under `gaps` and §18 under `sourceIssues`, which is where they now are.

## For the review (REV-PAPER-HE-21)

Two removals are the things to check first, since a rejected finding leaves no trace in the file:

1. §5.4 argument (a), "Hence `∪_Y Z_Y ⫋ Z`", was recorded as a gap on the grounds that an arbitrary union of proper closed subsets can cover an irreducible scheme. It cannot: the generic point of the irreducible `Z` lies outside every proper closed subset, whatever the number of components of the preimage. What a formalisation still needs there — the carrier and a fibre-dimension theorem valid in it — is gap `G2`.
2. [HY12, §4.2]'s "`J = supp(w)` for any `w ∈ O_min`" was recorded as a misprint about ordinary versus saturated support. That paper's §1.2 defines `supp(wδ) = ∪_n δ^n(supp(w))` on a twisted coset, so the sentence is correct under its own convention.

The two largest surviving findings are `E1` (the basic seed of §6.3 is quoted from a theorem whose shrunken hypothesis the constructed `a t^γ` fails whenever `γ` is not regular) and `E6` (§2.2's summary of the cited reduction omits "of adjoint type", which is what makes `ρ^∨_J` a coweight and so `w_1`, `w_2` and `a t^γ` elements of `W̃`).
