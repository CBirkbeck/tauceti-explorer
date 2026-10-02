# REV-RT-PAPER-JIANG-ZHANG-20

Independent verification for issue #4082 by Codex, session `codex-5ebb6f`,
2026-10-02. This session neither wrote nor reviewed the Jiang–Zhang extraction,
its original review, or this red team. The red team's disclosures about its
other work were read; no verdict here depends on adopting its own earlier
verdicts. This session previously verified the separate Cai–Friedberg–Kaplan
red team, but the unitary-dual ownership check below uses the actual stage
contracts and accepted proposals.

**Result: 60 findings checked; 59 confirmed and /26 rejected.** Every finding
has a separate reason in
[RT-PAPER-JIANG-ZHANG-20.review.json](../redteam/RT-PAPER-JIANG-ZHANG-20.review.json).
Confirmation identifies the supported defect; qualifications in those reasons
are binding limits on the proposed fixes. It does not certify an unproved
replacement theorem. The extraction and red-team inputs were not edited.

## Evidence and scope

Read all 60 findings, the red-team report, all 88 extraction items, its seven
routes, prerequisites and source-issue corrections, the reader report and the
original review. Checked against repository base `c3cd19e` and its assembled
stage graph, including the actual ML.4/ML.5, AS.1/AS.2, AL.3/AL.4, AF.1,
SR.2/SR.3, ET.6, ReductiveGroups Layer 7 and GN.2 contracts. Checked the
relevant accepted routes from Liu et al., Nelson–Venkatesh,
Beuzart-Plessis–Liu–Zhang–Zhu, Beuzart-Plessis–Chaudouard–Zydor,
Ciubotaru–Harris and Gan–Savin; also the confirmed real-representation
ownership finding RT-AREA-automorphic-1/2 and the Witt coverage in AUDIT-05
and AUDIT-02. Read `make_queue.paper_designs` to verify the proposal merge.

Downloaded the [published Jiang–Zhang paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p02-s.pdf),
89 PDF pages, SHA-256
`c016d9729f7f0cdca451e14a62015bd85cde861a9e07d3135e8feff071d0b15f`.
Read printed pp. 740, 742–744 and 748–827: **84 pages**, targeted to the
findings, including all of Sections 2–7 and Appendices A–B. This was not a
whole-paper reading: pp. 739, 741 and 745–747 were not read. Printed page
equals one-based PDF page plus 738. Viewed rendered pp. 766, 785–786, 791,
805, 808 and 813–814 to check conjugation bars and matrix shapes independently
of text extraction. This verification did not compare the arXiv v4 source
or certify the red team's version-history claims.

Read these additional primary-source excerpts:

- [CKPSS04](https://www.numdam.org/item/PMIHES_2004__99__163_0.pdf),
  printed pp. 167, 225 and 227–228: split-group setup, Theorem 11.1 and the
  separate invocation of Zhang's nonvanishing lemma.
- [Gan–Gross–Prasad, arXiv:0909.2999v1](https://arxiv.org/pdf/0909.2999v1),
  pp. 4 and 88–91: the linear restriction form, its L-group representation and
  Conjecture 24.1. These are the arXiv pages, not a claimed reading of the
  entire published Astérisque text.
- [Chen–Zou, arXiv:2103.07956v3](https://arxiv.org/pdf/2103.07956v3),
  Introduction and selected Section 7 passages, particularly Assumption 7.2,
  Proposition 7.3, Theorem 7.7 and Remarks 7.8–7.9. Checked the current
  [Ishimoto listing](https://arxiv.org/abs/2301.12143) for its explicitly
  generic odd-SO scope. These checks do not constitute independent reviews
  of the complete classification proofs or a reading of the Chen–Zou journal
  version.

The GRS book, Arthur/Mok/KMSW books and preprints, JZ14, Kim05,
Mœglin's residual-spectrum papers, Tadic, Vogan, ABV and Zhang's original
1997 theorem were not independently read in full. Verdicts about incomplete
statements, omitted dependencies and mismatched cited scope distinguish those
limits from verification of the cited proofs. No inaccessible reference is
reported as read, and no general unramified integral theorem is certified.

## Corrections the fixer must preserve

The unitary convention findings /2, /3, /11, /19 and /22 must be resolved
together. The images show that (4.7)/(4.9), (5.6) and Theorem 5.3 use a
bilinear pairing, while Conjecture 2.3, Theorem 5.7 and Theorem 6.10 use the
Hermitian pairing. The summand argument on p. 808 then uses a bilinear
pairing as though membership in a Hilbert subspace guaranteed its
nonvanishing. For a non-self-dual unitary character these implications differ.

The red team's alternatives are not one established repair. Replacing the
residue pairing by a Hermitian pairing, also replacing the smaller-group
pairing, or reversing a base-change convention changes different pieces of
the proof. Fix a dictionary for the inducing representation, base change,
ordinary versus conjugate dual, Fourier character, both pairings, local
numerator/denominator, residue and descent parameter. Recompute the split
unitary case before asserting a general corrected theorem. In particular,
do not withdraw E26 merely by renaming its L-function or treating a proposed
Hermitian reformulation as proved. The references to “finding 1” in the
unitary fixes refer to /2, not the Arthur-parameter defect /1.

An independent split-place check corroborates the denominator defect /19.
For the GL3 torus `diag(z1,u,z2^-1)`, its positive root characters are
`chi1 mu^-1`, `chi2 mu` and `chi1 chi2`. This is the tensor normalization
with the dual smaller-group parameter under the extraction's plain tensor
convention. Conjugate self-duality likewise does not turn the numerator
`tau × tau` into `tau × tau^∨` for /22. These checks reveal a convention
inconsistency; they do not supply the deferred integral theory.

Finding /26 is **rejected**. Its item includes identification of packet-defined
factors with those of the generic packet member. Moving it to AS.2 and
importing ML.4 would close the existing path
`AS.2 → AS.3 → AS.6 → ML.4`, exactly the cycle confirmed in /5. A general,
parameter-free analytic factor theorem can have an early shared owner;
the packet comparison must remain downstream. The current placement of
that comparison in the descent consumer is not shown erroneous.

The merged GGP proposal does have concrete consumer-return dependencies in
the Liu/trace-comparison and Nelson–Venkatesh routes. However, a documentation
list of which consumer proves a case is not itself a theorem import. Keep
shared definitions and conjectures in GGP, proofs using a consumer's machinery
with that consumer, and one owner for the flag-based Bessel data. TAD then
proves their identification with orbit data and constructs the Bessel modules.

The classification fixes /10 and /30 need a current scope table. Section 6
uses nongeneric parameters with doubled SL2 blocks, so “the main theorems
only use generic parameters” is incorrect. It is also too broad to say all
nongeneric even-orthogonal/unitary inner-form cases are unavailable:
Chen–Zou's Assumption 7.2 requires `n_i > Witt index` for blocks with `d_i>1`,
and Theorem 7.7 gives a further full F-rank-one case. These are theta-packet
results with explicit comparison requirements. Preserve the O/SO,
outer-orbit and packet-label distinctions instead of treating a source
title as the complete interface. KMSW's generic result must not silently
cover arbitrary nongeneric inner-unitary parameters.

For /23 and /34, CKPSS's nonarchimedean split-group theorem is narrower than
the extracted all-place classical theorem. Its proof invokes an additional
nonvanishing lemma after proving holomorphy. Nonzero rank-one factors do not
by themselves imply a nonzero composition. Record the missing argument;
check Zhang's hypotheses and an archimedean replacement before marking it
supplied. This is a proof-gap finding, not a constructed counterexample to
the complete theorem.

Several smaller corrections also need care:

- /1's odd-dimension obstruction is for the orthogonal simple-endoscopic
  datum; odd-dimensional unitary groups exist.
- /8's extra connected central torus concerns positive-index characters in
  the full unitary Levi. The zero-index restriction convention is separate.
- /16's very-even pair consists of two geometric SO-orbits. Galois may
  exchange them; neither F-stability nor rational classification is automatic.
- /25's scalar must match the chosen local Bessel normalization. It can be
  explicitly absorbed, but cannot be silently omitted or inserted twice.
  The constructed section families need a finite flat-section expansion
  with appropriate holomorphic coefficients; arbitrary holomorphic families
  are not automatically Laurent-polynomial families.
- /49 must not infer that AS.1 lacks all smooth-section analysis: its
  contract already asks for holomorphic sections and differentiated growth
  estimates. The real discrepancy is the general noncuspidal inducing data
  and the unstated reduction from isobaric data.
- /54 removes Conjecture 6.8 only in its specified form case. It does not
  eliminate the earlier deferred analytic input, and `SO_(2n+2,2n)` has
  dimension `4n+2`.
- /60's AF.1b is still a proposed successor. It is not a current atlas stage
  and does not automatically supply Vogan's unitary-dual classification.

## Pinned library verification

Checked the actual source at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
Mathlib's `Matrix.unitaryGroup` is the matrix star-transpose group; it does
not give the arbitrary Hermitian-space classification needed here.

For /15, Tau Ceti's public Witt extension theorem requires a nondegenerate
restricted form and finite dimension over a field with 2 invertible; it
does not require the ambient form itself to be regular. Witt cancellation
requires a regular finite-dimensional cancelled summand. The decomposition
API is an isometry-class API, so converting it to chosen hyperbolic
coordinates remains work. Its present quadratic coverage does not supply
the Hermitian analogue.

The proposed `TauCeti.QuadraticMap.anisotropicReflection` citation is a
**private helper** at `CartanDieudonne/Basic.lean:47`. Use the public
`TauCeti.QuadraticMap.reflection`, `reflectionOrthogonal`,
`reflection_apply_of_isOrtho` and `det_reflection` in
`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup.lean` instead. Their
invertible-norm and finite-module hypotheses were checked. A determinant
correction must also prove that a suitable anisotropic vector in the
orthogonal complement exists. The public last-vector SO stabilizer API is
for a square-line product, requiring a coordinate/isometry conversion for
the paper's arbitrary line; it is partial reusable coverage, not the
complete Bessel stabilizer theorem.

This is source verification and planning review. No Lean file was edited,
and no Lean compilation, Lake build or cache download was performed.

## Validation

Checked that the review has exactly one verdict for each of the 60 input
finding ids in the original order, with no duplicates or extra ids.

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-JIANG-ZHANG-20.review.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-JIANG-ZHANG-20.review.json research/blueprint/reviews/REV-RT-PAPER-JIANG-ZHANG-20.md`
- `git diff --cached --check` and an exact comparison of staged paths with
  the two authorized issue deliverables.

The source gaps remain obligations for the fix/design workers, with the
qualifications above. No implementation or unconditional proof claim is
inferred from the 59 confirmations.
