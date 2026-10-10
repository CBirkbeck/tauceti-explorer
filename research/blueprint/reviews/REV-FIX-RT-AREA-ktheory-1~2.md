# Independent review of the second K-theory area fix

Refs #5542. Job `REV-FIX-RT-AREA-ktheory-1~2`; Codex — `codex-qY3SVa`,
10 October 2026. Bot comment 6099804434 confirmed claim comment 6099803184.
This session did none of the fixes, their red team or its verification.

The **seven-packet review named by the GitHub issue is complete**. It retains
three accepted area-fix verdicts (N.1, T.1, K3BlochGroups) and four negative
verdicts (K.1, K.6, N.7, T.3). Their previous same-job verdicts, authored by
`codex-dbAQYQ`, are preserved in `reviewHistory`. Acceptance concerns the
38 confirmed high/medium area findings, not unrelated gaps in these partial
packets. Nothing is claimed implemented or formalized.

**The queue job is not complete.** Its 22 packet outputs exceed the seven
packets and seven suggested files explicitly named by the GitHub issue.
The remaining fifteen suppliers have reviews by other jobs; intake requires
this job's verdict on every packet in its current output list. The earlier
report's claim of whole-job completion was therefore incorrect. WORKERS.md's
instruction to edit only files the issue names prevents silently expanding
the scope. A scope clarification is pending. The supplier files have been
read and structurally checked, but not edited or certified by this run.
The handoff lists all fifteen, so another worker need not rediscover the
reason previous submissions became checkpoints.

## Current evidence and corrections

This run reread the issue, verified red-team dispositions, round-two fixes,
earlier review, original packets/signatures, current supplier interfaces,
and the pinned statements supporting the targeted corrections. The table
below retains the earlier dispositions where the repairs are unchanged and
updates finding /23 against the current destination. Source readings made
by this run are distinguished from the retained earlier evidence below.

No mathematical declaration changed in this continuation. The corrections
are to review metadata, the stale /23 destination assessment, the stage-cycle
diagnostic, and the report/handoff's completion claim. In particular:

- **/4 and /20:** the 467 original packet nodes are acyclic, but their actual
  stage projection contains K.3↔K.7 and K.6↔K.7. Concrete witnesses are
  `K.3/transfer-maps-and-projection-formula` importing
  `K.7/products-from-biexact-functors`, and
  `K.7/compatibility-with-relative-groups-and-transfers` importing that K.3
  transfer node. Similarly `K.6/nonconnective-spectrum` imports the K.7
  product, while `K.7/morita-invariance` imports `K.6/negative-k-groups`.
  Proposed new parents do not change the actual `parentStageId`. The
  maintainer must apply the early-products and late-cofinality splits.
- **/11:** `16 < 275/16` and the order of 2 modulo 5 is four. Thus the norm
  bound alone allows an element whose prime support is later than a norm-11
  place; it does not establish membership in the required Uₘ. This tests
  the sufficiency of the bound, without asserting that the paper's algorithm
  chooses 2. The explicit representative and finite-data proof remains
  unverified. The official AMS full-text URL again returned HTTP 403.
- **/12 and /28:** the current LocalFieldsRamification README and suggested
  signatures retain nonarchimedean local-field hypotheses. The arbitrary
  residue-field extension `Q((t))→Q((s))`, `t=s²`, still lies outside that
  supplier. The stronger routing request in T.3 is not an available general
  norm/lattice/length theorem. The read-only current upstream library was
  checked separately from the pinned baseline; no build was run there.
- **/21:** Quillen §4, Theorem 3 and Corollary 1, publication pp.108–111
  (PDF pp.24–27), distinguish ambient admissible-subobject closure in the
  one-step result from resolving kernel closure in the bounded filtration.
  The existing correction retains this distinction and does not assume
  projective lifting for the successive categories.
- **/30:** the actual pinned bar differential sends a degree-two generator
  to `[b]−[ab]+[a]` for trivial coefficients. The kernel-complex proof sends
  `[a]−[b]` to `ab⁻¹` modulo `[E,N]`; its inverse uses `[n]−[1]`.
  The displayed two-chain differences give both inverse identities and
  conjugation invariance. `chainsMap_f_map_epi`, `chainsMap_comp`, the H₁
  trivial-coefficient generator formula and connecting-map naturality supply
  the specified actual maps. Löh supplies the spectral-sequence/naturality
  reference, not this worker-derived kernel proof.
- **/23:** both `S.4/k-coniveau-spectral-sequence` and
  `S.4/g-coniveau-spectral-sequence` now import `H.6/exact-couple`,
  `H.6/filtered-spectrum-spectral-sequence` and
  `H.6/spectral-sequence-convergence-exhaustive`. This destination obligation
  is carried. By contrast /5 and /33 still have H.3's rational-Hurewicz
  owner and Borel's H.3 consumer, with no stated homotopy associativity.

## Current validation

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` are the baseline.
All seven authorized packets pass `scripts/check_blueprint.py` with
**zero errors and zero warnings** using the pinned declaration index.
Read-only checks of the fifteen additional queue packets also report zero
errors/warnings; that does not replace their required mathematical reviews.

All seven actual suggested files elaborated successfully with `lean-check`,
serially, with available memory above 20 GB. Warning totals, all for admitted
declarations, are N.1 **124**, K.1 **0**, T.3 **275**, N.7 **45**, K.6 **6**,
T.1 **72**, K3BlochGroups **807**. Comments containing future signatures
are not type checked. The suggested files were unchanged, so these are the
checks of the final executable content. No language server or Lake build,
update or cache command was used. There is no standalone link map or
restructuring result in the issue's deliverables.

The run reread the pinned `ExactStructure` and `FiniteResolution` carriers,
the bar chain maps/differential and H₁ generator formula, and the generic
`HomologySequence.δ_naturality` statement. Existing exact-K₀ and
finite-projective work stays imported. Current upstream
GrothendieckEulerForms, AlgebraicVectorBundles and LocalFieldsRamification
were inspected to avoid duplicating their definitions or widening their
hypotheses.

Public source copies fetched and read by **this session**:

| Source | Locators reread | SHA-256 |
| --- | --- | --- |
| [Quillen, Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf) | §4 Theorem 3/Corollary 1, publication pp.108–111, PDF pp.24–27 | `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04` |
| [K-book III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | §5.3.2–5.5.1, chapter pp.37–38, including Recognition and Kervaire | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| [K-book V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) | Proposition 1.7 and its relative-S/additivity interface, chapter p.8; §2.1–2.4, chapter pp.12–17, including localization and the enlarged cofinal weak class | `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8` |
| [K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | §5.2–5.4, chapter pp.23–25, including the number-field K₃ specializations | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| [Löh, Group Cohomology](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) | Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, printed pp.123–125, PDF pp.131–133 | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` |

Restricted book copies were not opened, fetched or copied. No source text
or excerpt is added to a packet. The older source readings and C1–C11
corrections below are explicitly the earlier reviewer's evidence, not new
source certifications by `codex-qY3SVa`.

## Verdicts for every confirmed finding

Every number denotes `RT-AREA-ktheory-1/<number>`. The obligations are /1–/37
and /39. /38 was rejected, and /40–/49 are low-severity findings outside this
fix. An accepted handoff means the seven authorized files retain a correct
owner/consumer contract; it does not accept an unreviewed destination.

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| 1 | Accepted repair/handoff | N.3 separates rank-zero, whose Q-category is equivalent to the terminal category, from the positive-rank building strata. The integral coefficient contract keeps `Steinberg ⊗ ℤχ^(n−1)`, with `χ=Norm(det)`, and finite-index arithmetic groups of nonfree projectives. Borel R.1 remains the finiteness supplier; its narrower destination text still needs the handoff. |
| 2 | Accepted handoff | M.1 and M.5d separately own field truncation, coefficient/naturality data, smooth-scheme comparison and the Dedekind form with its topology hypotheses. The Dedekind result is not inferred from smoothness over a field. Destination naturality and truncation remain supplier work. |
| 3 | Accepted repair/handoff | N.5 imports Suslin comparison in positive degrees, using KO for real and KU for complex fields. RT.4 supplies the real topological theory. The dyadic degree-zero exception is kept outside the positive-degree assertion. |
| 4 | Needs changes | The S-grid, latching, additivity, relative paths, iteration and coherence are now decomposed, but the early product stage and construction ordering are still proposals. Current parents induce a K.6/K.7 cycle and a K.3/K.7 cycle. The unit/K₀ adapter also belongs early; I corrected its proposed parent and handoff. |
| 5 | Accepted corrected handoff | H.3 owns plus/simple-space and local-coefficient Whitehead inputs. Rational Hurewicz belongs to H.6, with the required connectedness and finite-type assumptions. The destination's H.3 rational-Hurewicz placement remains wrong; the explicit H.6 handoff is preserved rather than certified applied. |
| 6 | Accepted handoff | Borel R.5's input is the specified inner-form arithmetic quotient, split at infinity, and a nonzero rational volume for the selected measures. This does not assert an unrestricted Tamagawa-number or strong-approximation theorem. |
| 7 | Accepted repair/handoff | Higher S-integer ranks are stated for degree at least two. Degree one uses the S-unit rank, including the extra finite places. Borel R.3 must export the same distinction. |
| 8 | Accepted handoff | M.3 remains the sole owner of the general-field Galois symbol and the separate local/global/S-integer Tate theorems. T.7 compares conventions; N.6 imports these results instead of reproving them. |
| 9 | Accepted ownership repair | N.6 owns certificates with upper generation and an independent lower bound. T.5 owns the degree-two tame sequence and elementary K₂ examples; N.2/N.8 import them, and U.1/U.2/Z.6 supply the classical degree-zero/one inputs. The integer word-reduction source remains inherited evidence, not a newly read restricted book. This verdict does not certify that source or the unresolved /11 certificate. |
| 10 | Accepted repair/handoff | N.4's finite twisted `w₂` and N.3's independent positive-degree finiteness precede the Birch–Tate formula. The order formula is not used to establish finiteness of K₂. |
| 11 | Needs changes | The Gaussian argument and the restriction/transfer/two-torsion reduction for ℚ(√5) are sound at their stated inputs. Cyclotomic unit-symbol generation still lacks Uₘ-compatible representatives and independently checked finite data. The 25/16 norm bound alone is insufficient; the explicit diagnostic is below. |
| 12 | Needs changes | The arbitrary finite normalization request correctly uses a pure-first normal hull and regular models without assuming smoothness. The all-degree norm/residue proof, however, imports generic complete-DVR norm/lattice/length results from a finite-residue local-field supplier. That scope failure remains real. |
| 13 | Accepted handoff | M.5d's Bloch–Gabber–Kato contract permits imperfect fields. Early differential/Cartier inputs are distinguished from prime-power logarithmic Witt inputs; mod-p `1−C⁻¹` is not a prime-power construction. |
| 14 | Accepted repair/handoff | Early Kummer cups land in `μₘ ⊗ μₘ`. A primitive root supplies the subsequent coordinate contraction. Multiplication of roots is not substituted for a bilinear tensor pairing. |
| 15 | Accepted repair/handoff | The relative-S path model keeps the zero augmentation and canonical zero-source path. The proof is iterated explicitly. H.2 still supplies proper/good simplicial realization, connectedness and the canonical homotopy-fibre comparison; C6 corrects the support comparison. |
| 16 | Accepted handoff | H.5's HR/Eilenberg–Mac Lane chain comparison includes grading, truncation and representability. Bare existence of a spectrum is not treated as a chain-to-spectrum equivalence or a module comparison. |
| 17 | Accepted mathematical repair; K.6 not accepted | The ring P¹ gluing category uses right modules and opposite-ring charts. The regularity/resolution, quotient, directed lattice, Nil and positive Laurent arguments are explicit; scheme clauses go to S.2/S.5. C7 corrects the separate finite-domination projector. The remaining product ordering prevents acceptance of K.6 as a whole. |
| 18 | Accepted repair/handoff | Classical relative triples, the π₀ comparison, Milnor patching and the four interior exact positions are separated from negative Bass exactness. U.6's henselian 1-connectivity is distinguished from a generally only 0-connective birelative input; positive π₁ surjectivity is an additional obligation. |
| 19 | Accepted mathematical repair; ordering pending | The early ring functor supplies arbitrary unital scalar extension and connective continuity. Unitization fibres and the complementary-idempotent extension treat nonunital matrix corners; filtered stable-fibre continuity is separate. A corner diagram is not relabelled unital. K.1/K.6's stage proposals still need application. |
| 20 | Needs changes | Free/projective group-completion cofinality gives the early ring comparison without importing general exact-category cofinality. The later class-weak/factorization proof is now decomposed, and C9 fixes its suggested weak class, but the required late K.3:cofinality stage has not been applied. |
| 21 | Accepted after C2 | Existing exact structures, finite projectives and ExactK₀ are reused. The extension base-change direction and localized fibres are explicit. One-step resolution now assumes ambient admissible-subobject closure; bounded resolution uses ordinary resolving closure and proves the stronger condition in successive length categories. Bühler's cokernel/3×3 route supplies the independent exact-category details. |
| 22 | Accepted handoff | H.1/H.2/H.3 supply nerves, covering/local-system and realization inputs. The Serre comparison uses AlgebraicTopology's twisted stage AT8. Constant coefficients from AT5 alone do not provide the required local-system statement. |
| 23 | Accepted handoff; destination now carries the imports | H.6 owns the general exact couple, filtered-spectrum sequence and convergence interfaces. The current S.4 K- and G-coniveau nodes import all three exact H.6 nodes and supply their own geometric filtration. The earlier claim that this destination still replans the machinery is superseded. This is a read-only contract check, not a whole-packet acceptance of SchemeKTheoryOperations. |
| 24 | Accepted handoff | U.4's SK₁ proof includes the finite-index S-unit subgroup argument and the exceptional rank-one cases. Those exceptions are not absorbed into a stable higher-rank statement. |
| 25 | Accepted handoff | U.4 keeps the verifier's number-field Bass–Milnor–Serre scope, importing CFT12, Chebotarev10 and CA1 reciprocity. No function-field theorem is inferred from this proof. |
| 26 | Accepted repair | K.3 owns the degree-one index `∂[α]=[coker α]−[ker α]`, DVR normalization `∂[π]=1` and right-action boundary. T.3 cites the exact nodes. T.5 distinguishes outside-S tame residues from the in-S relative sequence and imports U.4's SK₁ surjectivity, removing the S.3 normalization cycle. |
| 27 | Accepted convention repair/handoff | T.7 distinguishes m=1, quadratic real signs and the m>2 case. Arithmetic Frobenius acts on the root of the second symbol entry, so the cubic ℚ₇ control detects the inverse exponent. The Chern comparison retains `c₂,₂=−h`. Milne III.3.6 is an unproved identity in those notes; CFT6 is explicitly asked to supply its proof. |
| 28 | Transfer repair accepted; residue closure needs changes | Milnor residues/norms precede comparison. Prime-degree generation, common finite-Artin length base change and prime-to-p descent give the general Milnor/Quillen transfer comparison. The generic complete-DVR substrate used by the all-degree norm/residue continuation remains outside its supplier scope, as in /12. E13's restricted-source attribution is inherited, not reverified here. |
| 29 | Accepted repair | V.1 imports T.1's perfectness/UCE results and retains its own plus-fibre/Hurewicz adapter. V.5's degree-three calculations now use N.5 and its own number-field theorem, with no reverse N.8 import. K-book VI.5.2.1–5.4 and Example VI.2.1.2 agree with those specializations. |
| 30 | Accepted after C5/C8 | The integral bar-kernel complex, H₁ identification with `N/[E,N]`, positive boundary and actual homology-map naturality fill the former Hopf gaps. No freeness of N is assumed. Concrete C₄→C₂ and S₃ sign-quotient examples distinguish the actual maps and mixed commutators. |
| 31 | Accepted corrected handoff | The doubled affine plane, rather than the line, has vector-bundle K₀=ℤ and perfect K₀=G₀=ℤ². Z.3's destination still records this only as an upstream note; that existing roadmap is not replanned here. |
| 32 | Accepted repair/handoff | Weil reciprocity imports AC12's regular point/place dictionary and AC2's finite normalization. The EC2 adapter handles disjoint-support evaluations, including equal normed values 81/25 and the uniformizer-last sign. It does not duplicate the upstream divisor construction. |
| 33 | Accepted corrected handoff | H.6 alone owns rational Hurewicz/Cartan–Serre/Milnor–Moore, with connected CW, homotopy associativity and finite-type qualifications for duals. Borel R.3 imports it. The known H.3 destination misplacement remains supplier work, as in /5. |
| 34 | Accepted handoff | Borel R.4 imports S.6's algebraic Adams operations and RT.4's comparison with topological operations before identifying regulator eigenspaces. Algebraic operations alone are insufficient. |
| 35 | Accepted handoff | Borel R.2 needs the early characteristic-zero Betti/de Rham/Lie-quotient comparison from ALS.5. It does not wait for downstream AS.5 or rebuild an existing algebraic-groups roadmap. |
| 36 | Accepted handoff | The Borel owner retains Burgos' all-weight normalization `Bo=2Be` and determinant factor `2^d`. The weight-two Bloch–Wigner computation remains a test, not an all-weight proof. |
| 37 | Accepted handoff; destination partly carried | Finite/local L.1 keeps Green's embedding/root choice and induction/restriction interfaces, RT.4's Atiyah–Segal/Adams inputs and `K⁻¹(BG)=0`. The simple-space Whitehead obligation is explicit; the destination still needs the actual simplicity argument. |
| 39 | Accepted handoff | L.5 imports the general logarithmic Witt construction before its DVR/TR specialization. CR4/5 precede CR6's Hyodo–Kato comparison; the odd-p and ℤ₍p₎-algebra hypotheses and model comparisons remain explicit. |


## Retained evidence from codex-dbAQYQ

The following is the earlier review record. Its first-person statements,
source hashes and corrections belong to **codex-dbAQYQ**. Current validation
is recorded above; the /23 destination assessment and whole-job completion
claim have been superseded. Preserve the mathematical repair history and
unrelated gaps when resuming.

## Scope and evidence

I read the red-team result and verification, both area fixes reports, the
first area review, the retained dedicated N.7/T.3 fixes and their later
independent reviews, all seven packets and suggested files, and the relevant
supplier contracts and reviewed library coverage. This follows
[REV-FIX-RT-AREA-ktheory-1](REV-FIX-RT-AREA-ktheory-1.md); N.7 and T.3 also
follow their 7 October dedicated reviews, which remain applicable.

The obligations are the **38 confirmed high/medium findings /1–/37 and /39**.
/38 was rejected; /40–/49 are low severity and outside this fix. An accepted
handoff below means that the repair identifies the actual missing exports,
their owner and consumers under PROTOCOL §17. It does not mean the supplier's
plan or implementation is finished. Acceptance of a partial packet here is
scoped to these repairs, preserving its unrelated recorded gaps.

The baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the cited declaration
statements and checked all **370 distinct baseline references** against the
pinned source trees/index. In particular:

- `ExactStructure`, `ExactK0`, the finite-projective exact structure and the
  Cartan/resolution maps are existing Tau Ceti work. Their higher-Q and
  Waldhausen comparisons are new work; their carriers are not supplied by
  the degree-zero results.
- `ModuleCat.extendScalars` at this pin is for commutative rings. The general
  right-module change-of-rings interface uses the opposite-ring owner
  contract. Projective scalar extension does not require flatness.
- `groupHomology.chainsMap`, its explicit degree-two differential,
  `H1AddEquivOfIsTrivial`, `H1π_comp_map`, `ShortExact.δ_apply` and
  `HomologySequence.δ_naturality` support the actual quotient-bar proof and
  its maps. The generic connecting map fixes the positive sign.
- Polynomial purely inseparable normalization finiteness is not a theorem
  for an arbitrary intermediate base; the pure-first normal-hull argument
  keeps that distinction.

I also read the relevant current upstream roadmaps and library, including
the newer AlgebraicVectorBundles, LocalGaloisGroups and ProfiniteArithmetic
directions, GrothendieckEulerForms' exact-K₀/resolution interfaces and
AlgebraicTopology's twisted Serre interface. Existing finite-projective,
exact-K₀ and low-degree arithmetic results remain imports. The ring-level
noncommutative projective-line gluing category is not a second affine
vector-bundle construction.

## Verdicts for every finding

Every number in this table denotes `RT-AREA-ktheory-1/<number>`.


## Earlier corrections C1–C11

**C1 — actual T.3 elaboration failure.** The iterated-dual-number D3 detector
produced four ring/quotient instance errors. I supplied the local `CommRing R`,
`I.IsTwoSided` and quotient `CommRing` instances before the pulled-back module.
The corrected file elaborates, with 275 `sorry` warnings only.

**C2 — resolution closure.** In `K.3/one-step-resolution-comma`, ordinary
kernel closure for epimorphisms between P-objects did not justify the
pullback/subobject arguments. The corrected hypothesis closes P under every
H-admissible subobject of a P-object. Finite projectives over
`k[ε]/(ε²)` distinguish the hypotheses: the usual resolving kernel condition
holds, but `εR ↪ R` is not projective. For `bounded-resolution-filtration`,
ordinary resolving closure and admissible covers suffice; the three length
inequalities prove the stronger condition for `Hₙ ⊂ Hₙ₊₁`. The third is the
kernel inequality, not another extension inequality. Pullback and cover
enlargement replace an unjustified projective lifting. Packet and suggested
comments agree with Quillen §4, Theorem 3 and Corollary 1, publication
pp.108–111 / PDF pp.24–27.

**C3 — automorphism-square locator.** The two K.1 citations to K-book
Exercise IV.7.9 now give chapter p.65, rather than p.75.

**C4 — noncommutative P¹ and cone locators.** The Rochester scan has two
printed page systems. Quillen §8.1–8.3 is publication pp.138–143,
typescript pp.130–135, PDF pp.54–59. K.6 now labels them explicitly.
The Bass-cone uniqueness citation is K-book III.4.4–4.5, printed
pp.213–214 / combined PDF pp.221–222, not PDF pp.224–225.

**C5 — public quotient-bar attribution.** The four new T.1 nodes now cite
Löh's Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, printed
pp.123–125 / PDF pp.131–133. These state the spectral sequence, action and
naturality; they do not construct it. The packet's direct derivation uses
the pinned bar differential, its kernel complex and generic homology exact
sequence. That distinction is explicit. The old HA source record and source
issue remain historical, with no claim to have consulted its uncleared scan.

**C6 — support and relative localization.** `K.5/relative-versus-support`
had overemphasized the difference of definitions. Bounded finite-projective
support complexes and the canonical homotopy fibre of the localization map
have naturally equivalent K-spaces after the localization theorem. Their
connective spectrum is the connective cover of the full stable fibre; the
K₀ localization cokernel can contribute to degree −1. The torsion-module
replacement requires nonzerodivisors. The title, statement, proof and
acceptance now retain both the comparison and this qualification, following
K-book V.2.6.3, V.7.1/7.1.1 and V.7.6.3, chapter pp.17,52,56.

**C7 — finite-domination signs.** The Ranicki projector mixed the input
convention `gf−id=dh+hd` with the matrices for `id−gf=dH+Hd`. It now sets
`H=−h`. Its diagonal is `fg` in even degrees and `1−fg` in odd degrees;
the adjacent block `Dⱼ₊₁→Dⱼ` is `(−1)^(j+1)d`, and the lower block
`Dⱼ→Dₖ` is `(−1)^(j+1)fH^(k−j)g`. The same H is used in the equivalence.
The suggested comments and a new sign-sensitive nonexample agree. As an
independent exact-arithmetic check, take three contractible intervals in
degrees (1,0), (2,1), (3,2), with `f=id`, `g=2id` and contracting homotopy s.
The corrected matrix is the direct sum of
`[[2,−1],[2,−1]]`, `[[-1,1],[−2,2]]`, `[[2,−1],[2,−1]]`.
It squares to itself; using `H=s` fails. The source is Ranicki Proposition
3.1, pp.118–122 / PDF pp.14–18, with the restricted-completion return
criterion in Proposition 2.1, pp.114–117.

**C8 — expressible five-term tests.** T.1 now has actual examples for the
unique C₁→C₂ bar map's missing basis element, the identity quotient maps,
the C₄→C₂ middle inclusion and final reduction, and the S₃ sign quotient.
The latter has trivial mixed coinvariants while the kernel abelianization
has cardinality three. The existing positive-boundary example is retained.
These are admitted test statements at real library carriers; they are not
completed proofs. Their elaboration adds four warnings to the prior total,
giving 72 `sorry` warnings and no errors.

**C9 — future cofinality weak class.** The K.1 signature comment intersected
the K₀-class condition with the old weak class. That would fail to enlarge
it. It now uses equality of object classes in the quotient, in agreement
with the packet and Thomason–Trobaugh Theorem 1.10.1, pp.275–277.

**C10 — source descriptions and compilation records.** No edited packet
contains an `excerpt` key. I removed stale `match` assertions about
verbatim transcription, keeping the mathematical descriptions in own
words. All seven suggested files now distinguish current elaboration from
older compilation records and explicitly exclude future comment signatures
from the checked declarations. Review prose uses the packet checker's
admitted-proof terminology; the checker rejects the literal Lean admission
keyword even inside review metadata.

**C11 — early unit-product adapter.** The early K.7:products proposal now
includes `unit-multiplication-and-K0-tensor-comparison`, whose only inputs
are the early product and pinned `SplitK0` product. Its proposed parent is
recorded in K.6 and the K.1 handoff agrees. This corrects the proposal; it
does not apply the stage split.

## Why four packets remain unaccepted

**K.1/K.6: applied ordering is still missing.** The combined graph of all
467 packet nodes has no cycle. Its projection to current stage parents
does. For example, `K.7/products-from-biexact-functors` feeds
`K.6/nonconnective-spectrum`, while the live stage ordering has K.6→K.7.
Likewise `K.7/biexact-stabilized-pairing` feeds
`K.3/localization-product-boundary`, while K.3→K.5→K.6→K.7 remains live.
The `K.4/fibration-with-factorizations` input to
`K.3/cofinality-with-factorizations` must be placed in a late cofinality
component. The live atlas still has neither K.7:products nor K.3:cofinality.
The proposals describe an appropriate repair, but the verifier required
applied ordering. Only the maintainer applies restructurings; live atlas
files are not authorized deliverables of this review.

**N.7: generation is not established by a norm bound.** At a norm-11 place,
the element 2 satisfies
`Norm(2)=det(2I₄)=16 < (25/16)·11=275/16`. The order of 2 modulo 5 is four,
so (2) is inert and has norm 16, later than that place. Thus the bound alone
does not put representatives in Uₘ. This is a diagnostic for the bound,
not a claim that a specified balancing algorithm selects 2. The packet's
existing gap now records that precise limitation. Zhang–Xu's public full
text/finite tables and Skalba's input were not independently obtained.
Consequently the cyclotomic generation step, and the real-quadratic upper
bound which imports it, remain open. The unconditional published theorem
is not refuted by this defect in the packet's proof decomposition.

**T.3: the generic complete-DVR supplier is out of scope.**
`Q((t))→Q((s))`, with `t=s²`, is a finite complete discretely valued
extension with residue field Q. It is outside the nonarchimedean local-field
scope of LocalFieldsRamification Layer 3. T.4 needs normalized extension
valuations, finite free integral-closure lattices, the valuation and residue
norm formulas, and the componentwise finite-base-change identity
`Σ eᵢ[lᵢ:Lⱼ]=r·length(Aⱼ)`, including inseparable residue fields.
A stronger request to the same finite-residue stage does not supply them.
An exact general supplier or a routed Part II is required; narrowing the
all-field Milnor theorem would not repair this finding.

Other supplier obligations remain explicit: H.6 ownership for /5 and /33,
S.4's imported exact-couple infrastructure for /23, scheme imports of the
ring theorem, M.1/M.5d naturality and truncation, Borel's full coefficient
contract, Z.3's plane example and L.1's simplicity proof. Their destination
files are outside this issue. The Keller criterion and finite-Artin K₃
calculations in K.6 are also preserved as older gaps, not silently filled.

## Public-source reading record

The following records concern the locators checked for this review; none
asserts that every proof in an entire book or paper was read. Statements,
source exercises and worker derivations are distinguished above.

| Public source | Locators used |
| --- | --- |
| [Quillen, Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf) | §4 Theorem 3/Corollary 1, publication pp.108–111; §8.1–8.3, publication pp.138–143, retaining the different typescript page numbers. |
| [Waldhausen, Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf) | §1.4 additivity, pp.335–340; §1.5 relative S, pp.341–345; Theorem 1.6.7 proof, pp.354–359; §1.9 S/Q comparison, pp.375–376. Scan images were used where OCR omitted pages. |
| [Thomason–Trobaugh](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf) | §1.9.6–1.9.8 and §1.10.1, pp.270–277, including the strictification and enlarged weak-class proof; read as scan images. |
| [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) and author [IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf)/[V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) chapters | The relevant exact-category/extension, low-degree triple and automorphism-square passages; III.4.4–4.5, III.7.10 and exercises; V.2.6.3, V.7–8; VI.2.1.2 and VI.5.2.1–5.4. Author chapter page numbers are retained when cited. |
| [Schlichting, Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf) | §11 and Appendix A, pp.20–27, especially factorization, approximation and the corrected factorization domain. |
| [Cárdenas–Pedersen, On the Karoubi filtration of a category](https://archive.mpim-bonn.mpg.de/547/1/preprint_1995_16.pdf) | §2.7/2.9, pp.6, and the filtration/completion/cone and approximation passages in §§3–7, pp.8–24. |
| [Karoubi 1970](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf), [Karoubi 1971](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf) | The graded relative index and cutoff relations (§2.11–2.16), cone/suspension and negative-theory comparison (§3), and the 1971 III.3.1–3.7 Bass comparison, pp.73–75. The negative comparison is not treated as a positive-spectrum theorem. |
| [Ranicki, The algebraic theory of finiteness obstruction](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf) | Proposition 2.1, pp.114–117; Proposition 3.1, pp.118–122 and Proposition 3.2, p.123; matrices read from scan images. |
| [Löh, Group Cohomology, 2019 notes](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) | Theorem 3.2.12, Proposition 3.2.13, Remark 3.2.14, printed pp.123–125 / PDF pp.131–133. |
| [Milne, Class Field Theory v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf) | III Proposition 3.6, p.109, and §4/Remark 4.5, pp.110–114: character evaluation, arithmetic Frobenius and the cup/Hilbert convention. Proposition 3.6 refers elsewhere for its proof. |

SHA-256 of the independently fetched copies, in the table's order (the K-book
entry is its combined author PDF):

```text
Quillen     5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04
Waldhausen  2f452696998132a438fe7596deb681fefcf829829b4604ca1029083e4dcb1c6e
TT          48cdb707515c4d2e3a525610f4ff2b5b3d579dbec3ddc01b508922a5e7a50a7b
K-book      a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845
Schlichting f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6
Cardenas    fade1b382a464d1a1cfc532bc304700042b0159006afcf30b73ecdacd14ee493
Karoubi70   3658a17a15ec4f81c9d8669a0af59bb2df01449c057bcd77f8a25a8cf712f717
Karoubi71   19591526e36387e946d554423b5cfebddb48f00642f7cbfe6b65d259cd1a5c19
Ranicki     2882abe515b8fa191a120a28dcbb555ec84e28da7b075cf3bc788078e08ca4b8
Loeh        d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76
Milne       50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5
```

Milnor's *Introduction to Algebraic K-theory*, Gille–Szamuely and Weibel's
*Introduction to Homological Algebra* were not cleared library copies for
this run and were not opened or copied. Historical source records and their
source issues are preserved as historical evidence. In particular E13 and
the old central-coefficient erratum are not newly source-certified by this
review. The public K-book is a separate author-hosted source.

## Earlier validation and file verdicts

`scripts/check_blueprint.py` at the pinned baseline reports **0 errors,
0 warnings for each of the seven final packets**. There is no standalone
link map or restructuring result among these deliverables, so
`check_links.py`/`check_restructure.py` have no input here. Embedded
restructuring proposals were checked for their mathematical ordering, with
the unapplied changes recorded above.

All seven suggested files were elaborated with `lean-check`. Changed
executable T.3/T.1 declarations were rechecked after correction; K.1 was
also rechecked after its signature-comment changes. The other final changes
to Lean files are plain compilation-record comments. No build/update/cache
command or language server was started; compilations were serial, with
available memory above the worker threshold.

| Packet | Nodes | Verdict | Lean errors | Only `sorry` warnings |
| --- | ---: | --- | ---: | ---: |
| ArithmeticKTheory N.1 | 56 | accepted | 0 | 124 |
| GeneralAlgebraicKTheory K.1 | 83 | needs_changes | 0 | 0 |
| K2SymbolsBrauer T.3 | 68 | needs_changes | 0 | 275 |
| ArithmeticKTheory N.7 | 20 | needs_changes | 0 | 45 |
| GeneralAlgebraicKTheory K.6 | 73 | needs_changes | 0 | 6 |
| K2SymbolsBrauer T.1 | 66 | accepted | 0 | 72 |
| K3BlochGroups | 101 | accepted | 0 | 807 |

Elaboration checks actual declaration types, not the truth of admitted
proofs or future signatures inside comments. K.1 in particular has only
three actual existing-library examples. This review makes no formalization
claim; every node's `implementationStatus` remains `unchecked`.

The [handoff](../handoff/REV-FIX-RT-AREA-ktheory-1~2.md) contains the concrete
next actions and survives scratch cleanup.
