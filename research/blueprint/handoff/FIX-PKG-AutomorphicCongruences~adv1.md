# FIX-PKG-AutomorphicCongruences~adv1 — checkpoint

Issue: #11424. Agent: Codex, session `codex-4S13Kl`. Date: 2026-10-20.
Branch: `codex-4S13Kl-fix-automorphic-congruences`.

**Status: incomplete, needs_changes.** The prerequisite-order decision in R1
requires the maintainer, and the remaining exact supplier and arithmetic
comparisons have not been established. This checkpoint preserves useful
source verification and mathematical repairs; it does not certify upstream
readiness. No second issue was claimed.

Read WORKERS, PROTOCOL, expansion/PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE,
the PadicMeasuresIwasawaAlgebras exemplar, the package and the independent
review and handoff. The issue's named
`research/blueprint/reviews/REV-PKG-AutomorphicCongruences~adv.md` is absent
from this checkout. The available findings are in
[REV-PKG-AutomorphicCongruences.md](../reviews/REV-PKG-AutomorphicCongruences.md)
and its matching handoff. All four residual findings there are addressed
below, without pretending that clarified obligations are completed proofs.

## Finding dispositions

| Finding | Change and evidence | Remaining work |
| --- | --- | --- |
| R1: tier/bundle closure | Re-read `upstream/CaraianiNewton.md`. AutomorphicCongruences has no entry. The file excludes AutomorphicPadicLFunctions and PadicHodgeRegulators except for specific moved-down notions, and does not order KatoEulerSystems. Requested the missing maintainer assignment; none was available when preparing this checkpoint. Kept ModularIwasawaMainConjectures and HeegnerPointEulerSystems as consumers. | Assign a valid order or bundle, including the necessary refinements, and audit every supplier edge against it. The order file and supplier packets are outside this issue's four deliverables. No order was invented or edited. |
| R2: exact external refinements | Rechecked the current IHG rank-two Ribet statements: their matrices are `Fin 2` by `Fin 2`, so neither the residually indistinguishable version nor its local conditions supplies the polarized three-block SU/Wan theorem. Rechecked the relevant Kato, Selmer, PadicFamilies and regulator contracts. Kept the exact refinement requests and integral hypotheses. | Provide the owner plans for polarized lattice/length, integral Yager, analytic finite-slope and equal-Satake comparisons, BSTW two-variable zeta/reciprocity/duality, and the recorded Hilbert and elliptic period/control adapters. Reconcile their order before declaring these imports closed. |
| R3: full integral CM congruence/Katz comparison | Obtained and read HT94 itself. Added original locators for Theorems 0.1–0.3, Proposition 5.1 and Theorem 7.1, with the PDF/printed-page offset and the rational, conductor, Euler and exceptional-prime qualifications. Added integral-versus-rational and p=3 negative Checks. The previous statement that HT94 had no verified original locator is resolved. | HT94's rational bounds do not determine the p-primary discrepancy. Its localized comparison and Hid06's p>3 theorem do not establish the full CLW integral contract at every allowed tame level, including p=3. Supply the exact integral lattice map, period normalization and theorem covering that scope; retain L0.9 and L2s.8. |
| R4: original-source and general-weight comparisons | Corrected the MP.6 contract and L2.4 proof route: Ikeda's dense-image comparison, as cited by FW, is distinct from FW's additional lowest-weight, finite-length and K-finite argument. Recorded the fixed splitting, β≠0 and weight-dependent dual Schwartz bases. Added `FourierJacobi.weightFunctional`, `FourierJacobi.twoFamilyChoice`, and `FourierJacobi.jointHeightOneAvoidance` as explicit general-weight extension targets, with negative Checks. | Original Harris Theorem 2.5.6, Ikeda Proposition 1.3/Theorem 3.2 and the theta/local-section comparisons, and Ichino's definite-unitary normalization remain unverified in the originals. The general-weight two-family extension remains a proof/comparison gap; naming it is not its solution. |

An additional duplication check found the proposed
`EisensteinIdeal.quotientEquiv` theorem already supplied by
`RingHom.quotientKerEquivOfSurjective`. Removed its sorry declaration and
planned API name, and retained the complete quotient and coefficient-map
contract under the Mathlib supplier boundary. `RingHom.comap_ker`,
`Ideal.mk_ker`, and `quotientKerEquivOfSurjective_apply_mk` identify the
contraction and the action on scalar classes. No arithmetic quotient
construction was removed. This is the only removed planned API item;
three named comparison targets were added in L2.4.

The equal-difference `hecke` example now also proves that Z→Z[X] misses X
after quotienting by the zero operator ideal. It uses the package's own
definition and the coefficient at degree one, so a proof that silently
omits quotient surjectivity fails this control. The other three proved
examples and the arbitrary-domain factor-separation milestone remain.

## Source verification and remaining access limits

All mathematical descriptions committed here are in our own words. No
source passage, PDF, image or source-text extraction is committed. Access
date for this run: 2026-10-20.

| Source | Directly inspected location and conclusion |
| --- | --- |
| [HT94 original](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf) | Printed pp.89–94 (PDF pp.2–7), pp.139–141 (PDF pp.52–54), p.146 (PDF p.59). Read the odd-prime/ordinary setup, primitive conductor and Leopoldt qualification, Theorems 0.1–0.3, local congruence/cotangent modules and Proposition 5.1, their height-one application, and Theorem 7.1/proof. The initial divisibilities tensor with Q; the later comparisons retain qualifications and do not yield the asserted full integral equality. |
| [FW v3](https://arxiv.org/pdf/2107.13726v3) | §7.4.2, pp.92–93, (7.4.2), Lemma 7.26 and (7.4.3), plus the lead-in on the weight-specific functional. The finite expression needs FW's K-finite argument. The original Ikeda locators are identified by FW, not certified here from Ikeda's text. |
| [CLW addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf) | §1, p.1; §3, pp.2–3; Theorems 4.0.1 and 5.0.1, pp.4–6. Its base modular form has weight two. Corrected auxiliary nonvanishing gives two choices, not three simultaneous units; independent variable directions give joint height-one avoidance. It does not state the required vector-valued extension. |
| [CLW v1](https://arxiv.org/pdf/2109.08375v1) | Proof of Theorem 8.2.1(2), p.81, compared with the retained L0.9 normalization contract. Its invocation of HT93/HT94/Hid06 is not itself the missing integral-lattice comparison. |
| [Hid06](https://ems.press/content/book-chapter-files/27475?nt=1) | Main theorem, pp.466–467, and Theorem 6.3, p.509. Rechecked the p>3 and character/conductor restrictions against the p=3 obligation. No extension to p=3 was inferred. |

The HT94 archive PDF is scanned; the inspected pages were read as images.
Its added archive cover accounts for the pagination offset. The archive's
IIIF manifest identifies article range LOG_0011 in volume 117.

Reproducibility hashes (SHA-256):

| File/version | Hash |
| --- | --- |
| HT94 archive article PDF | `1481798eb0b299d1393bd7b3c413a515a30eca4b4ae5a693dea043ead55057a6` |
| FW v3 | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| CLW v1 | `0dcb80a52de820ef08982a94211377a7a7b56e47a9305bf217ba38f57726e45e` |
| CLW addendum | `c008624ff05f61c3780f02aaddf1188f4a68ec01cfffb9f1e63bd4d994820fd9` |
| Hid06 | `80736300d5bf408ef9bc480257cf8983464ef63c90d0e3abe011658544d8108a` |

The primary Annals record for Harris is
<https://annals.math.princeton.edu/1984/119/p02> (119(1), pp.59–94,
DOI 10.2307/2006963); its page and the author's publication index did not
provide the original text. The attempted Annals PDF route returned 404.
Ikeda's Project Euclid article PDF, DOI-download and legacy-download routes
returned challenge HTML rather than a PDF. Ichino's DOI-download and legacy
route did likewise; its DOI is 10.1215/00127094-2008-052 and the legacy
article identifier is euclid.dmj/1224508838. The Columbia-hosted
`goldfeld/Ichino.pdf` is only a one-page conference abstract and was not used
as evidence for the original theorem. These are access observations, not a
claim that no readable original exists elsewhere. No credential or external
code was used in response to fetched text. No suspicious instruction was
encountered in the inspected source material.

## Adversarial pass on changed statements

| Statement | Instances tried and result | Disposition |
| --- | --- | --- |
| `hecke` and `base` over arbitrary commutative rings | Empty differences give the zero Hecke ideal; contraction can still retain the coefficient kernel. Equal values, difference 5 and difference 1 give (0), (5) and (1). Z→F5 distinguishes the two ambient ideals. Fields, characteristic two and the zero ring do not require extra domain hypotheses. | Definitions and scope retained; four proved examples cover the selected witnesses. |
| Imported first isomorphism theorem | Zero quotient and unit ideal are harmless. The map must be onto its stated target. Z→Z[X] with zero differences fails onto-ness, witnessed by coefficient 1 of X; Z→F5 is instead surjective and noninjective. | Cite existing theorem, delete duplicate target, retain the coefficient compatibility. Polynomial failure is a README Check and proved Lean example. |
| Coefficient-map compatibility of the imported equivalence | The image of [r] is [ι(r)], including r=0 and r=1. The kernel of the composite quotient map is exactly the contraction; no injection hypothesis is needed. | Read the pinned definitions and computation lemma. No arithmetic comparison inferred. |
| HT94 versus an integral CM/Katz comparison | Odd p includes 3; p=2 is excluded by its setup. O and a residue field are different coefficient settings. The integral ideals (p) and (1) agree rationally but have different uniformizer valuations. If 3 divides φ(Nc), that localization loses the 3-primary information. | Keep original scope and explicit integral gap; do not narrow CLW's endpoint. |
| CM period normalization | Unit rescaling preserves the ideal. Uniformizer rescaling changes its integral valuation; fraction-field line equality does not detect the difference. Ramified O uses its own uniformizer valuation. | Added discriminating Check; no replacement of a uniformizer by p. |
| Dense Jacobi map versus finite decomposition | Density for arbitrary smooth vectors is insufficient. FW fixes β≠0, splitting and a K-finite nearly holomorphic component; lowest-weight and finite-length arguments give finitely many contributing K-types. β=0 is outside this argument. | Replaced the overbroad attribution by the precise two-step contract; original Ikeda hypotheses remain to verify. |
| `FourierJacobi.weightFunctional` | k=2 is the scalar comparison. For k>2 the chosen component and dual Schwartz bases depend on k. A single ordinary specialization map cannot identify those components by itself. | Explicit named comparison target, still unresolved at general weight. |
| `FourierJacobi.twoFamilyChoice` | Two auxiliary choices must have the same relevant eigenvalues and compatible boundary normalization. Two nonzero values may still share a height-one factor. The weakened nonvanishing does not imply three simultaneous units. | Preserved source scope and specified the missing construction and product identities. |
| `FourierJacobi.jointHeightOneAvoidance` | In Qp[[X,Y]], (X,Y) is proper of height two and lies in no height-one prime; neither generator is a unit. X,X² share (X). Sending Y to 0 destroys avoidance. A unit value suffices, while two zero values fail. | Exact prime-by-prime quantifier and negative Checks added; no assertion of a unit ideal or specialization argument. |
| Retained `factorSeparation` signature | Empty index type is vacuous; a singleton has the asserted equality by the two inclusions. Nonzero factors in F2 are units and satisfy cancellation. A zero analytic factor makes cancellation invalid; zero divisors are excluded by `IsDomain`. | No signature change; the general domain hypothesis and all four arithmetic opposite bounds remain. |

Statements about three-block lattices still retain the residual distinction,
middle irreducibility, polarization and local conditions already recorded.
Neither rank zero nor the trivial representation supplies an accidental
replacement for those hypotheses. The general connected-group, finite-slope
and all-weight supplier theories stay with their named owners; no new
GL2-only general theory was introduced.

## Library and roadmap audit

Read the package's entries in `data/library-coverage.json`; its old absence
claims are not authoritative for current Fitting or completed-algebra APIs.
Confirmed the current roadmap tree at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Rechecked the nine newer
roadmaps and the four Completed roadmaps by mathematical objects, alongside
the earlier independent review's full target-family audit. Quadratic-form
lattices, local Iwasawa presentations, GL2 Eisenstein series, and geometric
bundles do not supply the changed polarized, CM or Fourier–Jacobi contracts.
The current classical character-Eisenstein carrier was read; it is not a
unitary Klingen family. No lake command ran in either current read-only tree.

Read the actual pinned Mathlib statements in
`Mathlib/RingTheory/Ideal/Quotient/Operations.lean` and
`Mathlib/RingTheory/Ideal/Maps.lean`, at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The library removal above is
based on those statements, not a name match. IHG's current local/global
Ribet signatures were also read, including their `Fin 2` matrix carrier.

All 92 numbered targets and anchors remain. All 92 Checks sections and all
previous bullet Checks remain. The two real-bodied Lean definitions, the
four proved examples and the factor-separation signature agree with the
README. The new heavy Fourier–Jacobi targets are named in the closing Lean
comment; no sorry'd carrier was introduced. The README has 2,636 lines and
Suggested.lean 111 lines.

## Validation

- `lean-check research/blueprint/packages/AutomorphicCongruences/Suggested.lean`:
  exit 0, exactly one `declaration uses sorry` warning for `factorSeparation`.
  All four examples are proved. Available memory was 78 GB before the final
  elaboration. The later edit only added closing-comment target names.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L0.json`:
  exit 0, zero errors/warnings; 69 nodes, 125 API items, 68 input unit tests.
- The same command on `AutomorphicCongruences--L5b.json`: exit 0, zero
  errors/warnings; 23 nodes, 5 API items, 4 input unit tests.
- Target/anchor/Check inventory: all retained, no unresolved internal link.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  exit 0, four files checked, zero problems.
- `git diff --check`: clean before submission.

## Resume and maintainer notes

1. Obtain the order/bundle assignment first. The issue requires suppliers
   before this roadmap; existing interfaces cannot be certified against an
   unassigned position. The omitted unitary/regulator work is not supplied
   by the narrow notions already moved down in CaraianiNewton.
2. Route R2's precise refinements to their existing owners; this issue does
   not authorize editing those packets. Preserve the Hilbert and elliptic
   period/control requirements while doing so.
3. Resume L0.9 with an original theorem or proof covering the exact integral
   congruence/Katz lattice and denominator bound, including p=3 and the
   permitted tame conductor. HT94 is now accessible and correctly scoped;
   merely citing it again cannot close the remaining p-primary comparison.
4. Obtain the three remaining originals. Compare their topology, local
   measures, splitting characters and weight bounds to the FW/CLW inputs.
   Prove or source the three explicit L2.4 extension targets before treating
   L2.6, L2.12–14 or the L4 seed argument as repaired.
5. Only after these residues are resolved should `review.json` become
   accepted. The prior independent report remains unchanged and supplies
   the untouched target/sample evidence.

Scratch sources and notes are disposable; all information needed to resume
is in this handoff. Only this issue's four deliverables were changed.
