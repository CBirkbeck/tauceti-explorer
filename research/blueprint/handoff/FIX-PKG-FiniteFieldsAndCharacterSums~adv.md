# FIX-PKG-FiniteFieldsAndCharacterSums~adv — checkpoint

Issue #11506; Codex, session `codex-di1meg`; 2026-10-20.

The package remains **needs_changes**. The binary Dwork and exact Gamma-source
findings are repaired at roadmap level. The computational, geometric-conductor
and Albanese findings have more precise consumer contracts but require changes
to other owners' packets and to publication ordering. This issue authorizes only
the package README, Suggested.lean, review.json and this handoff. Those external
changes cannot be completed within that scope; this is a checkpoint, not an
acceptance or a claim of formalisation.

The issue's `REV-PKG-FiniteFieldsAndCharacterSums~adv.md` is absent. The input
actually present is [REV-PKG-FiniteFieldsAndCharacterSums.md](../reviews/REV-PKG-FiniteFieldsAndCharacterSums.md),
whose five remaining findings are dispositioned below. The package's previous
reviewer and authors are different workers.

## Finding → change

| Finding | Change in this checkpoint | Disposition |
| --- | --- | --- |
| CN semantics, overlapping ownership and order | `contract-P-R21` / `contract-F3-R01` now name the requested ring-program, sampling, tail and expectation interfaces. `contract-P-R22` / `contract-F3-R02` name dense-polynomial decoding/refinement interfaces. Unit inversion, independent trials, cost/success correlation, termination and bit-cost sampling are explicit. `contract-P-R30` and `contract-F3-R03` use Lean's existing `of_decide_eq_true` and native checker soundness; the unnecessary CN.5 import is removed. | Partial. The missing interfaces, duplicated certificates/Hensel algorithms and publication order require the coordinated owner changes below. |
| Geometric complete-DVR conductors | `contract-P-R11` / `contract-F2-R10` identify AGR's existing break/conductor targets and its explicit infinite-perfect-residue prerequisite gap. They retain continuous finite-dimensional E-adic representations, ℓ≠p, finite wild image without imposing finite tame image, tensor bounds and dominant twists. §2.9 imports AGR's existing general Artin–Schreier break/conductor targets; its additional work is the native place/completion/sheaf comparison. | Partial. Neither a finite-residue theorem nor the name of the general-valued-field Part II supplies the missing classical filtration. |
| General Albanese–Weil comparison | `contract-F2-R15` now names the universal rational-map, birational, section and Picard/Tate targets, with perfect-base, geometric-integrality, generic-open, section-dimension and normality conditions. It distinguishes a pointed geometric map from the descended unpointed torsor. The cone example prevents conflating Alb_w and Alb_s. | Partial. These are exact requests, not claims that A2 or its existing Part II exports them. |
| Binary Dwork splitting | `contract-F1-R01` / `contract-F1-R02` consume DirichletPadicLFunctions L3 §4.5's actual all-prime scalar series, root normalization and trace-character equality. Both consuming product-proof descriptions use this supplier; neither relies on odd-prime RD.6.46/6.48 for p=2. Robert's coefficient locator is corrected. Native coefficient and binary character checks are proved. | Resolved locally as a dependency on existing L3 targets. Their implementation remains the supplier's work. |
| Exact Gamma route / unverified Cohen locators | New `contract-F1-R03` states the exact L3 §4.6 orbit quotient, natural recurrence, admissible precision, root-power and residue steps. Both digit/product targets cite the directly inspected public Gross–Koblitz and Robert papers. The public odd-prime source is distinguished from L3's independent all-prime recurrence/Euler argument. The old mod-5 control was valid but did not distinguish an inverse multiplier; a mod-7 control does. | Resolved locally. No uncleared book was used, no p-power root is identified solely from its residue, and no binary theorem is attributed to the odd-prime printed statement. |

All 439 target subsections and all 443 existing `FF…` anchors are retained.
The 122 existing `Checks` blocks remain; there are now 127. Existing hypotheses,
locators and worked examples were retained or sharpened. No general theorem was
replaced by an example. Metadata and all five blueprint packets are unchanged.

## External changes needed before acceptance

### ComputationalNumberTheory / finite-field ownership

Read [CN's package](../packages/ComputationalNumberTheory/README.md), §§0.1–0.7,
0.15–0.17 and 1.22–1.26, alongside
[its packet](../packets/ComputationalNumberTheory.json). The integer RAM model
is real existing planning; generic ring-cost/random-program semantics are not
exports of that model. In addition, the package already plans Rabin certificates,
relative presentations, changes of presentation, factor certificates and Hensel
lifts. Merely adding requested interface names in FF cannot reconcile these
owners.

A concrete coordinated resolution is:

1. Keep the shared Rabin/presentation/change-of-presentation and factor-certificate
   carriers in CN.0/CN.1, where the package already describes them. Add their
   missing packet nodes and the generic ring/randomness/refinement targets stated
   in FF's contracts. Make FF's corresponding entries imports and native
   comparison targets. FF retains its additional tensor/normal-coordinate and
   discovery-algorithm mathematics, rather than a second certificate carrier.
2. Give CN.1 the generic adic/Jacobson-radical Hensel theorem and algorithm, with
   the prime-power case as a specialization. Redirect FF's duplicate field/adic
   lifting entries to it while retaining their existing general statements and
   Checks. This requires a genuine extension of CN's present prime-power scope.
3. Replace five existing reverse prerequisites in the CN packet, rather than
   declaring a bottom-up order while they still point back to FF:

| CN node | Existing FF prerequisite to reconcile |
| --- | --- |
| `CN.1/polynomial-factorization-over-finite-fields` | `FF.3/factorization-certificate-sound` and `FF.0/presentation-change-isomorphism` |
| `CN.1/certified-rational-factorization` | `FF.3/hensel-lifting-modulo-prime-powers` |
| `CN.2/prime-ideal-factor-certificate` | `FF.0/certified-presentation-of-a-finite-field` |
| `CN.2/phi-residual-polynomial` | `FF.0/certified-presentation-of-a-finite-field` |
| `CN.2/ore-residual-irreducibility` | `FF.3/hensel-lifting-modulo-prime-powers` |

Here node prefixes denote their full `ComputationalNumberTheory:` or
`FiniteFieldsAndCharacterSums:` ids. CN's README additions do not yet have all
these owner nodes in its packet; do not invent ids and call them exports.
Once the coordinated redirects are made, verify the entire dependency graph
and register a publication order for the shared computational layer before FF,
or an explicit bundle if residual mutual dependencies require it.
[CaraianiNewton.md](../upstream/CaraianiNewton.md)'s opening excludes both full
roadmaps from its order; its move of elementary FF.1 services into AN.1 and of
minimal certified numerics into EffectiveDiophantineMethods does not order these
remaining packages. CN's downstream paragraph mentioning FF's use of CN.5 also
needs updating to match the removed replay dependency. This checkpoint does not
edit those files or implement the proposed ownership move unilaterally.

The publication audit must also reconcile 13 legacy L3 Cartan prerequisites
back to `FF.4/galois-ring` or `FF.4/galois-ring-is-local` in
`DirichletPadicLFunctions--L3.json`. Examples are
`L3/kubert-cartan-cartan-unit-reduction` and
`L3/kubert-cartan-limit-cartan-witt-projection-surjective`. The current L3
package uses native finite-field/truncated-Witt carriers. Compare the legacy
edges to its actual required native properties, redirect any library-supplied
ones, and account for any remaining FF.4 dependency in the order or bundle.
Independence of L3's scalar arithmetic proof from rigid cohomology is not a
proof that the whole L3 package precedes FF.

### Perfect, possibly infinite, residue fields

[AGR's package](../packages/ArithmeticGaloisRepresentations/README.md), §3.1,
explicitly records that the general perfect-residue filtration is assumed.
Its §3.4 `artinConductor_unramifiedBaseChange` has that setting; citing it is
not an independent construction of the missing filtration. Its §3.7 already
plans the field-level results at the exact native packet ids
`ArithmeticGaloisRepresentations:R01.3/artin-schreier-break` and
`ArithmeticGaloisRepresentations:R01.3/artin-schreier-swan-conductor`.
FF now imports these and retains the additional geometric comparison.

Allocate the classical complete-DVR extension under the LocalFieldsRamification
parent: lower groups over arbitrary perfect residues, Herbrand transforms and
quotient compatibility, absolute upper groups, and the Hasse–Arf/integrality
input needed by AGR. Then discharge AGR's standing hypothesis and supply
`swanConductor_tensor_le`; reuse its existing dominant-twist and base-change
APIs. An alternative finite-residue-to-completed-maximal-unramified proof must
construct and compare the full filtrations and invariant dimensions.

The existing [LocalFieldsRamificationPartII packet](../packets/LocalFieldsRamificationPartII.json)
is about arbitrary-valued-field tameness. Its continuation brief
`LocalFieldsPartIIKatoSwanConductors` concerns cohomological Kato filtrations
and itself imports AGR's classical perfect-residue Swan conductor. Neither is
an already supplied general classical ramification theorem. Preserve that
boundary when assigning the extension; do not plan another Kato filtration.

This foundation serves geometric Artin–Schreier sheaves, hyper-Kloosterman
monodromy and correlation conductors. No restriction to finite residues,
finite tame image, integer-valued individual slopes or rank one is a repair.

### General Albanese–Weil supplier

Extend the AbelianSchemesAndArithmeticModuli parent with the precise targets
in `contract-F2-R15`, including descent, rational-map universality and the
normal-projective Picard/Tate and generic-section comparisons. Its current A2
and [Part II packet](../packets/AbelianSchemesAndArithmeticModuliPartII.json)
do not construct that general Alb_w; the latter's universal-extension,
Betti-map and finite-field Tate targets are different mathematics. The current
JacobianChallenge handles pointed curves. An `IsAlbanese` predicate supplies
neither existence nor the singular-projective comparison.

Register owner nodes/requests and route FF's section bound, all-extension
Bombieri–Sperber expansion and top odd-weight spectrum through them. Keep
multiset/spectrum comparison distinct from an unproved canonical representation
isomorphism. Ghorpade–Lachaud §9, pp.26–29, especially Example 9.2 and
Propositions 9.4/9.6, gives the source controls in the README.

Other inherited exact delivery gates also remain: SF.0 bounded projective
closures; SF.4 relative equivariant Artin–Schreier surface resolution; LPV.0
local acyclicity over general bases and global/local comparison; RD.6 explicit
Euler-degree comparison; and native Hermitian point/place/Riemann–Roch
comparison. This checkpoint preserves their contracts and does not certify
their completion or the remaining general six-operation/weight suppliers.

## Adversarial pass on touched statements

| Statement or interface | Instances / hypotheses tested | Result and change |
| --- | --- | --- |
| Generic ring program and unit inversion | Field vs Z/4; 2 nonunit with square zero; unit 3 inverse 3; zero ring and failed inversion distinct from divergence | Partial inversion/unit-witness requirement made explicit; integer RAM not relabelled as a ring-cost model. |
| Generate-and-test output, tail and cost | Success probabilities 0, 1 and 1/2; correlated trial cost (success 3, failure 1); independent trials vs repeated reuse of one random choice | At 1/2, mean cost 4 and tail at k=2 is 1/4; the within-trial independence assumption is unnecessary. The zero-success case has no terminating output PMF. |
| Uniform sampling and bit simulation | Non-power-of-two support; F_2² has four vectors, while the basis sampler has only two | Exact binary rejection has expected bit cost; full coefficient-vector draws remain necessary. |
| Dense polynomial refinement | Zero/constant encodings; divisor 1; nilpotent coefficients; X²≡2 mod X²+1 over F_3 | Remainder and native decoding equations retained. Total Euclidean gcd is over coefficient fields; the unit-pivot ring version is partial. A noncomputable AdjoinRoot equivalence does not establish executable refinement. |
| Finite decision/checker reflection | Empty vs full finite domains; a sample list vs exhaustive enumeration; external Boolean vs proved equality | Existing kernel reflection replaces the CN.5 request; checker soundness and cost remain separate obligations. |
| F_65537 residual logarithm fold | All 65,536 nonzero inputs, 16 stages each; α=1,2,3 | Independent Python computation checked residual=1, range and 3^x=α on the full domain; outputs 0,55296,1. Native Lean proofs pin 3^32768=−1 and 3^55296=2. This is not a Lean proof of the general fold or its cost. |
| Scalar Dwork coefficients | n=0,1,2; p=q=2 vs q>2; inverse factor sign | Native PowerSeries examples prove A_0=1, A_1=−2, A_2=4 at q=2, and the opposite sign gives linear coefficient 2. The formal series is the one named in the contract. |
| q-series coefficient bound | f=1; n=0; arbitrary f>0; weighted convolution degrees | The bound has radius greater than 1. q=1/f=0 is excluded. Robert's p.167 estimate is used with the finite-product convolution, not ordinary exponential evaluation at the boundary. |
| Splitting value and compatible roots | p=q=2; p=2,f=2; changing zeta without changing pi | Binary prime-field trace-character value −1 is proved natively. The f=2 trace of 1 is 0; its product value is 1. Compatible-root normalization and coefficient embedding stay explicit. |
| Gamma recurrence / exact orbit quotient | m=1, k=0, 0<k<M; p=2; precision 2 vs cofinal precision ≥3 | Native finite Gamma product at 4 is 3 mod 4, unlike Γ_2(0); unrestricted dyadic precision-2 congruence is excluded. Distinct roots ±1 coincide mod 2 and differ mod 4, proved in Lean. |
| Gamma finite-precision probes | (p,f,m,k)=(2,4,3,1),(2,4,3,2),(2,6,3,1),(2,6,7,1) mod 2^8; (3,2,2,1) mod 3^4; (5,1,2,1),(5,2,3,1) mod 5^4 | Computed quotient equals the indicated Teichmüller power; root-power and orbit unit-count divisibility hold. These probes control the arithmetic, not prove the p-adic limit. |
| Digit sum/factorial distribution | b=0,m=1; mod-5 self-inverse multiplier; p=7,m=2,b=1; binary f=4,m=3,b=1 | Existing boundary checks kept. New proved mod-7 values 5 vs 6 detect the inverse multiplier; new binary digit sums give 6 on both sides beyond the permutation case. |
| Hasse–Davenport completion and ordinary product target | m=1; trivial χ and χ^m; q=4,m=3 permutation case; q=16,m=3,χ=omega^−1 non-permutation case | All-prime statement kept. An exact computation in F_2[X]/(X^4+X+1) and Z[zeta_15] gives 64 on each side in the q=16 case. Exactly m source-negative signs cancel on each side; exact Gamma quotient supplies the missing equality. No extra theorem or cohomological route replaces it. |
| Geometric breaks and tensor/twist | V=0; tame/infinite-tame image; rank-two break 1/2 with total Swan 1; strictly dominant rank-one twist | Integrality is for the total conductor. Existing AGR dominant-twist API is reused; classical infinite-residue filtration remains a named blocker. |
| Native Artin–Schreier comparison | p=2,m=1; u=t^−m with p∤m; u=t^−p reduces to t^−1; u=0 split torsor; phase bf | Imported general AGR theorem; native place/completion/sheaf comparison retained. Zero and p-divisible poles do not meet the pole hypothesis. |
| Albanese / Picard / section contract | Point/dimension 0; curve normalization; section dimension 1 vs ≥2; normal cone over positive-genus curve; absent rational base point | General rational-map object and descent retained. Alb_s cannot replace Alb_w even for normal X; the stronger section conclusion and Picard comparison have their distinct hypotheses. |

## Sources, library boundaries and validation

Direct source reads for this fix:

- Robert (2001), printed pp.166–169, including rendered pp.167 and 169.
  The coefficient estimate is in the tail lemma's proof, not Appendix 1;
  Appendix 2 invokes Dwork's root theorem, which L3 includes as a proof target.
- Gross–Koblitz (1979), rendered printed pp.574–576: Lemma 2.11,
  Theorem 3.1(2), (3.2)–(3.3), with its odd-prime scope.
- Ghorpade–Lachaud (2008), §9, pp.26–29, for the Albanese distinctions and
  section hypotheses.
- Shoup v2, §9.3 Theorem 9.3, pp.287–289, and §17.1 Theorem 17.1,
  pp.465–467: generated/trial output, expected costs and unit-leading division.
  The other inherited source locators were not all reverified by this bounded fix.

Public PDF SHA-256 receipts, identifying the editions read:

- Robert: `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581`.
- Gross–Koblitz: `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522`.
- Ghorpade–Lachaud: `ff23c51a5e416778136588329492550a1b7d4c0e02c1f63c49fbda0fd3f63835`.

Cohen II and Robert's 2000 book are not cleared in the library index; no copy
was read or reproduced. The changed route uses the public papers. No source
passages are copied into the repository.

Rechecked relevant current upstream material at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the post-snapshot
roadmaps/Completed boundary already audited by the review. AlgebraicCodingTheory
and Completed/EffectiveBounds supplied nearby roadmap models. The fix uses
native PowerSeries, finite-field characters, ZMod and existing logical reflection;
it adds no replacement carrier. L3 §§4.5–4.6 and its packet explicitly supply
the all-prime scalar arithmetic targets consumed here.

- `lean-check research/blueprint/packages/FiniteFieldsAndCharacterSums/Suggested.lean`
  exits 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`: 57 warnings, all
  `declaration uses sorry`, no other warning/error. The 1,096-line file has
  38 light definitions/abbreviations, 57 milestone theorems and 50 proved
  examples. No data or example is admitted. No new Lake project, library
  build, language server or cache download was used.
- All five unchanged FF packets pass `scripts/check_blueprint.py` with zero
  errors/warnings. Those syntactic checks do not close their recorded gaps.
- The four deliverables pass `research/blueprint/intake.py check-files`;
  `git diff --check` and target/anchor preservation checks pass.

Resume with the three coordinated owner changes above; do not repeat the repaired
Dwork/Cohen source search. Recheck the native geometric comparison against the
supplier when its filtration foundation is supplied. No suspicious
instruction-bearing external text was encountered; sources and other workers'
reports were treated as mathematical evidence only.
