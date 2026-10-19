# Independent review: REV-FIX-RT-AREA-ktheory-1~2

Refs #5542. Codex, session `codex-WBAmLh`, 19 October 2026.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258124657)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6258126178).
This session wrote none of the original fixes being reviewed.

**Checkpoint: the seven authorized pairs are reviewed and their fixable Lean
shape defects are corrected.** The live issue names seven packet/Lean pairs,
whereas `queue.json` requires nineteen. WORKERS.md permits edits only to
issue-named files. Expanded authorization was requested but has not arrived.
The remaining twelve pairs were inspected read-only; their other independent
reviews were preserved. Their missing area-review verdicts make the actual
queue job incomplete. A negative review is itself a completed review outcome;
the negative K.1/K.6 verdicts do not cause this completion-predicate failure.
See the [handoff](../handoff/REV-FIX-RT-AREA-ktheory-1~2.md) for the exact list.

This report replaces the repeated checkpoint narrative with current findings.
Earlier source certifications, repairs and failed checks remain attributable
to their authors in the packets' review histories and the
[preceding report](https://github.com/CBirkbeck/tauceti-explorer/blob/1634ea539f881e9dd1a96cacedcd866a4ccad598/research/blueprint/reviews/REV-FIX-RT-AREA-ktheory-1~2.md).
In particular, the prior reviewers' restricted-book readings are not presented
as this session's readings. No source passage is newly quoted here.

## Packet verdicts and corrections

Each immediately preceding top-level review is preserved verbatim in
`reviewHistory`. Every new review names this area-review job. Partial packet
statuses, unrelated gaps, supplier requests and unchecked implementation flags
are retained. Acceptance below concerns the confirmed area-fix obligations,
not completion of every target or supplier.

| Packet | Verdict | Reason |
| --- | --- | --- |
| ArithmeticKTheory--N.1 | Accepted | Mathematical contracts retained; admitted K₀/K₁/twist data removed from the Lean companion. |
| GeneralAlgebraicKTheory--K.1 | Needs changes | Actual product/cofinality stage ordering still needs the proposed restructuring. |
| K2SymbolsBrauer--T.3 | Accepted, scoped | Arbitrary-residue DVR support is explicitly routed with hypotheses and multiplicities; supply remains an open gap. |
| ArithmeticKTheory--N.7 | Accepted, scoped | Direct golden-field argument and exact finite certificates replace the obsolete cyclotomic route. |
| GeneralAlgebraicKTheory--K.6 | Needs changes | Lean shape corrected; actual stage ordering remains unresolved. |
| K2SymbolsBrauer--T.1 | Accepted | UCE/Hopf/transgression contracts retained; admitted construction data removed from Lean. |
| K3BlochGroups | Accepted | Ownership fixes retained; oversized construction file replaced by statements over pinned kernel/tensor carriers. |

The four changed Lean companions now follow the current WORKERS shape rule:

- **N.1:** retain the S-unit preimage submonoid, localization milestones,
  height-one prime test notation, period-four rank formula and examples.
  Remove admitted ring K₀/K₁ maps and equivalences, the invented Tate-twist
  development and the other construction/API chains.
- **K.6:** retain a finite-domination record over Mathlib chain complexes,
  existence of transport and a homotopy idempotent, and two examples.
  Replace admitted transport/homotopy data with existence propositions;
  remove the cone-ring instance and Nil-category development.
- **T.1:** retain centrality/universality and superperfectness predicates,
  actual integral Mathlib group homology, recognition and kernel/H₂
  milestones, and simple controls. Remove admitted Steinberg presentations,
  lifts, bar objects and chosen comparison equivalences.
- **K3:** retain the actual kernel element `(mx,h)` and its divided tensor
  class with a specified unit denominator, the projection and independence
  milestones, and concrete controls. Remove admitted field-Bloch, higher-K,
  comparison and auxiliary construction development. The generic algebra
  does not identify arbitrary groups with absent field objects.

These are selections of statements, not replacement roadmaps. Before removal,
I checked that the full targets, API outlines and discriminating checks already
occur in the existing reader documents, including V.6's integral-root-multiple
and root-coefficient-class. No reader file is an authorized deliverable here,
and none was edited. No target node was deleted or weakened. The changes do
not implement the removed constructions or prove admitted theorems.

## Current mathematical evidence and boundaries

**N.7 and finding /11.** The current golden-field route uses Tate descent,
bounded congruence representatives, ordinary-unit stretch and descent across
an earlier prime of equal norm. It does not require the former Zhang–Xu/
Skalba cyclotomic representative step. The large-prime inequality is
`16(2√5/π)² = 320/π² < 33`; the unit-symbol upper bound four and the two-real-sign
lower bound four are independent of Birch–Tate. The retained Gaussian route
uses its own norm bound and norm-two symbol calculation. The earlier scoped
acceptance and detailed proof reading are retained with their attribution.

This session independently recomputed every finite certificate in
`certificateData.certificates` of N.8/golden-finite-prime-certificates:
**11 certificates, 173 relation witnesses and 23 selected determinants**.
The indices are `3,4,8,10,10,18,18,28,28,30,30`. The verifier checked prime norms,
the exact earlier-prime generator list, residue images and multiplicative
generation, factor exponents, the equation `a−b=πw`, exponent differences,
selected determinants and their gcd `q−1`. A changed coordinate of one
`differenceOverPrime` witness was rejected. This does not claim a separate
Smith-form computation of the complete relation lattice.

Reproduction without scratch: represent elements by `(a,b)` with `ε²=ε+1`.
Multiply as `(ac+bd,ad+bc+bd)`; invert using
`((a+b),−b)/(a²+ab−b²)`. Reduce modulo `(π)` by multiplying by `π⁻¹`, taking
both coordinates modulo one and multiplying back by `π`. Enumerate the subgroup
of nonzero residue classes generated by the stored old-unit generators; its
size must be `q−1`. Verify every stored factorization and witness equation.
For each stored minor take the specified relation columns, compute its exact
integer determinant and require the gcd to be `q−1`. Mutating a witness must
fail. This checks the concrete finite data, not external supplier closure.

The existing Gaussian title and `w₂=24` check retain the previous review's
correction: `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`, rather than a finite group of order 24.
The factorization of `w₂` is `8·3`. The field invariant and the arithmetic
specialization agree with [K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf),
Example 2.1.2, chapter p.7, and Corollary 5.3, chapter p.24.
Three unrelated N.7 gaps and ten supplier requests remain open.

**T.3 and findings /12,/28.** I rechecked the explicit LocalFieldsRamification
Part II support plan. Its four contracts cover normalized complete-DVR
extensions, the finite free normalization lattice and `ef`, determinant norms
with valuation/residue comparisons, and componentwise Artin-length base change.
Inseparable residue extensions remain allowed; the generic product-of-fields
claim retains separability. For the ramified control `s²=t` over `ℚ((t))`,
`N(s)=−t` and `(e,f)=(2,1)`; a constant quadratic extension has `(e,f)=(1,2)`.
The characteristic-two control retains nonreduced residue-tensor lengths.

Freshly read [Stacks Lemma 10.121.8, 02MJ](https://stacks.math.columbia.edu/tag/02MJ)
requires a one-dimensional Noetherian local domain and a finite extension of
domains for its norm/order formula; it requires no finite residue field.
[Remark 15.116.1, 09EM](https://stacks.math.columbia.edu/tag/09EM) distinguishes
the reduced generic tensor from its integral closure, and explains the
separable case. It is not a citation for the entire stronger componentwise
identity. [Lemma 10.119.7, 00PD](https://stacks.math.columbia.edu/tag/00PD)
supplies the Noetherian local normal dimension-one DVR criterion.
The support plan's extra length calculation remains its own proof obligation.

Current Tau Ceti already exports `TauCeti.Algebra.norm_quotient_mk` in
`RingTheory/Norm/Quotient.lean`, lines 29–48, for a finite free commutative
algebra. I read that statement separately from the pin: the supplier must
reuse it, not re-plan it or assume it belongs to the older pinned build.
The Part II still needs registration and supply. That gap and five other T.3
gaps are retained, including the distinct finite-rank commutative-ring
monomial-kernel obligation. Field Matsumoto does not supply that statement.

**T.1 and findings /29,/30.** Fresh reading of
[K-book III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4 and Recognition Theorem 5.4,
chapter p.37, supports the retained UCE conditions, perfectness, rigidity,
Hopf identification and superperfect recognition milestone. The reader still
carries the integral bar-kernel, actual naturality maps and positive-boundary
comparison. Its odd-order Heisenberg control distinguishes the two signs;
the comparison itself remains a target, not an established Lean proof.
The CFT6 character-evaluation identity also remains supplier work.

**K.1/K.6 and findings /4,/19,/20.** The current graph of **470 concrete nodes**
in the seven packets is acyclic. Projecting to actual stage parents still
produces backwards product dependencies:

- `K.7/products-from-biexact-functors` supplies `K.6/nonconnective-spectrum`,
  against the atlas path `K.6 → K.7`.
- `K.7/biexact-stabilized-pairing` supplies
  `K.3/localization-product-boundary`, against `K.3 → K.5 → K.6 → K.7`.

Both edges and opposing paths were recomputed in this session. Proposed
`K.7:products` and `K.3:cofinality` stages are still absent from the actual
atlas. The maintainer must apply the early-product/late-cofinality splits.
Workers do not edit the atlas to apply restructuring. Successful elaboration
and the concrete-node DAG do not resolve this stage-order defect or establish
closure through external suppliers.

## Every confirmed finding

The verifier confirmed /1–/37 and /39. It rejected /38; /40–/49 are outside
this round's confirmed high/medium scope. A contract acceptance below judges
the correction and its explicit boundary; it does not certify its supplier.

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| 1 | Accept contract | Rank-zero and positive-rank strata are separate; the latter uses the integral orientation-twisted Steinberg module, including nonfree projectives. |
| 2 | Accept contract; supplier open | Field, smooth and Dedekind comparisons retain separate hypotheses. M.7's étale comparison alone is not the full Zariski truncation/naturality interface. |
| 3 | Accept contract | Real/complex comparison distinguishes KO and KU and preserves the dyadic degree-zero exception. |
| 4 | Needs changes | The construction/additivity split is present, but actual product parents still create the stage-order conflict above. |
| 5 | Accept routing; destination open | Simple-space Whitehead belongs to H.3; rational Hurewicz belongs to H.6. The destination placement still needs correction. |
| 6 | Accept contract | Inner forms, archimedean splitting, measures and a rational nonzero volume remain explicit hypotheses. |
| 7 | Accept repair | The higher S-integer rank formula starts at degree two; K₁ keeps its finite-place unit contribution. |
| 8 | Accept ownership | M.3 owns the general-field symbol and arithmetic Tate comparisons; T.7 and N.6 import them. |
| 9 | Accept ownership | N.6 owns independent certificate bounds, T.5 the tame sequence and N.8 instances; the separate ring monomial-kernel source gap remains. |
| 10 | Accept repair | Twisted-invariant finiteness and independent positive-degree K-finiteness precede Birch–Tate. |
| 11 | Accept replacement | The direct golden-field argument supersedes the defective cyclotomic route; all finite data were rechecked. |
| 12 | Accept routing | The arbitrary-residue DVR Part II has explicit contracts; registration and implementation remain open. |
| 13 | Accept contract | BGK allows imperfect fields; differential/Cartier support is separated from prime-power logarithmic Witt support. |
| 14 | Accept repair | The Kummer product has two root-of-unity factors before a chosen coordinate contraction. |
| 15 | Accept repair/contract | Relative S-construction retains augmentation, path and iteration; realization and fibre comparisons remain H.2 obligations. |
| 16 | Accept contract | H.5 supplies graded/truncated chain-to-HR comparison and representability, beyond a bare spectrum. |
| 17 | Accept repair | Noncommutative right-module gluing, resolution and Nil/Laurent inputs remain distinct from the scheme results owned elsewhere. |
| 18 | Accept contract | Relative triples and interior exactness do not assert unrestricted excision or unconditional henselian π₁-surjectivity. U.1 compilation remains supplier work. |
| 19 | Accept mathematics; ordering open | Ring scalar extension and continuity precede nonunital unitization/corner fibres; the corner is not treated as unital. The actual stage split is pending. |
| 20 | Needs changes | Early free/projective comparison avoids general cofinality, but the latter still lacks its actual late parent stage. |
| 21 | Accept correction | Resolution retains ambient admissible-subobject closure and the stronger successive bounded-length condition; pinned exact structures and ExactK₀ are reused. |
| 22 | Accept contract | Coverings and local systems remain in H.1–H.3; twisted Serre comparison imports AT8 rather than constant coefficients alone. |
| 23 | Accept contract | Scheme coniveau owns its filtration and imports exact-couple/convergence support from H.6. This is not a full SchemeKTheoryOperations verdict. |
| 24 | Accept contract | Number-field SK₁ retains the finite-index unit argument and exceptional rank-one cases. |
| 25 | Accept contract | Bass–Milnor–Serre stays within the confirmed number-field scope and uses reciprocity; no function-field extension is inferred. |
| 26 | Accept repair | T.3 imports the precise K.3 index/DVR sign nodes; T.5 separates outside-S residues from in-S relative exactness. |
| 27 | Accept convention | Arithmetic Frobenius acts in the second symbol slot; the cubic ℚ₇ control and `c₂,₂=−h` remain. CFT6 still owes the evaluation proof. |
| 28 | Accept repair/routing | Transfer comparison and residue comparison are distinct; complete-DVR substrate is the explicit Part II, not finite-residue support. Restricted-source certification is inherited. |
| 29 | Accept ownership | V.1 imports T.1 perfectness/UCE and owns the plus-fibre adapter; V.5 imports N.5, and N.8 imports V.5. |
| 30 | Accept repair | Integral bar kernels, `H₁=N/[E,N]`, actual naturality and the positive boundary are explicit; the odd-order control detects inversion. The comparison is still proposed. |
| 31 | Accept correction | The doubled affine plane distinguishes vector-bundle K₀=ℤ from perfect K₀=G₀=ℤ²; existing upstream material is noted rather than replanned. |
| 32 | Accept ownership | AC12 owns point/place comparison, AC2 normalization and EC2 disjoint-support evaluation/reciprocity conventions. |
| 33 | Accept routing; destination open | Connectedness and finite-type qualifications remain on the H.6 rational homotopy contract; R.3's H.3 placement still needs rerouting. |
| 34 | Accept contract | Borel eigenspaces require both algebraic Adams operations from S.6 and topological comparison from RT.4. |
| 35 | Accept contract | R.2 uses early ALS.5 Betti/de Rham/Lie-quotient comparison, not downstream AS.5. |
| 36 | Accept retained contract | Burgos' all-weight normalization and determinant factor remain; weight two is only a control. Earlier full source certification is not renewed here. |
| 37 | Accept contract; supplier open | Green choices, induction/restriction and topological comparison are separated; the simple-space argument is still owed. |
| 39 | Accept contract | General logarithmic Witt support precedes DVR/TR specialization, preserving odd-prime/ℤ₍p₎ hypotheses and CR4/5 before Hyodo–Kato. |

## Validation and its limits

All nineteen current queue packets pass `scripts/check_blueprint.py` with zero
errors/warnings; the twelve additional passes are read-only schema checks,
not independent review acceptances. There are no separate link-map or
restructuring-proposal deliverables in this issue, so their standalone
checkers are inapplicable; embedded proposal fields are checked as packet data.

All seven authorized Lean companions elaborate serially with `lean-check` at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the shared Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` build. Available memory was above
20 GB before each run. The Mathlib source commit was checked directly; the
Tau Ceti snapshot pin is the shared build's recorded pin, not a newly queried
Git revision of that source snapshot.

| Suggested basename | Lines | Errors | Sorry warnings | Admitted-data diagnostic |
| --- | ---: | ---: | ---: | ---: |
| ArithmeticKTheory--N.1 | 124 | 0 | 10 | 0 |
| GeneralAlgebraicKTheory--K.1 | 817 | 0 | 0 | 0 |
| K2SymbolsBrauer--T.3 | 605 | 0 | 30 | 0 |
| ArithmeticKTheory--N.7 | 551 | 0 | 27 | 0 |
| GeneralAlgebraicKTheory--K.6 | 65 | 0 | 3 | 0 |
| K2SymbolsBrauer--T.1 | 95 | 0 | 8 | 0 |
| K3BlochGroups | 101 | 0 | 10 | 0 |

Only sorry warnings occur. The data-body check was run on scratch copies
with nested block and line comments removed, preserving line numbers,
and the changed definitions were inspected manually. The heuristic alone is
not a complete shape proof. K.1's commented future signatures do not elaborate
and its zero-warning result certifies only its actual pinned-library examples.
The four rewritten files contain no chains developing unsupported theory.

Fresh pinned statements read include `Set.integer`, `HeightOneSpectrum`,
`InfinitePlace.nrRealPlaces`/`nrComplexPlaces`, `Homotopy`, `HomotopyEquiv`,
`groupHomology`, `Subgroup.center`, `Group.IsPerfect` and `TensorProduct.map`.
Current upstream roadmaps and current Tau Ceti were inspected read-only; the
current norm-reduction theorem was distinguished from the older pin.
No library build, update, cache download or language server was used.
No private source was copied or newly quoted.

The prior session's U.1 nine-error elaboration result and supplier observations
are retained as attributed earlier evidence, not rerun or repaired outside
scope. The actual queue completion predicate remains false because twelve
outputs lack this job's review. A scratch-only diagnostic limited to the live
issue's seven pairs returns true. No queue scope was changed to obtain that
result. Resume only after the issue is reconciled with the queue or expanded
scope is explicitly authorized.
