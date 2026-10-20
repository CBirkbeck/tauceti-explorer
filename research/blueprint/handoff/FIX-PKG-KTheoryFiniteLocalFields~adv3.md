# KTheoryFiniteLocalFields package fix

Job `FIX-PKG-KTheoryFiniteLocalFields~adv3`, issue #11283. Codex, session
`codex-8yCnzz`, 20 October 2026. **Finished fix; accepted for the obligations of
this issue.** This is not an independent review or a claim that the roadmap is
formalised. The claim bot confirmed the session at
[issue comment 6281577149](https://github.com/CBirkbeck/tauceti-explorer/issues/11283#issuecomment-6281577149).

## Finding dispositions

| Finding | Change and evidence | Disposition |
| --- | --- | --- |
| R1, unassigned supplier order | The issue expressly authorizes K2SymbolsBrauer, MotivicEtaleKTheory, RefinedTraceMethods and HermitianKTheoryOfPoincareCategories before this roadmap. The exact-contract section now records their roles and consumed sections, without an unassigned-order obligation. It distinguishes the motivic field-descent branch from its downstream §11.1 rigidity application. GeneralAlgebraicKTheory supplies the finite-field comparison before GeometryOfNumbersAndQuadraticArithmetic and the hermitian supplier, so this package's finite-field refinements are not their own prerequisites. | Resolved by the maintainer's authorization and explicit contract graph. No order or other package was edited. |
| R2, missing general multiplicative comparison | Read the authorized frozen HermitianKTheoryOfPoincareCategories README §§7.10–7.11. The exact contracts and §1.7 now consume its named `finite-even-multiplicative-l-tate` and `multiplicative-l-tate-base-change` exports. GeometryOfNumbersAndQuadraticArithmetic §6.8a remains the underlying spectrum-square supplier. The finite-even application explains why a unital graded map fixes the invertible degree-two generator, its inverse and all Laurent monomials. | Resolved as prerequisite ownership and statement coverage. The supplier owns the general construction; this fix does not certify the Paper IV proof. |

The earlier independent review's other six repairs remain in place: completion
and Adams operations (§§0.1–0.2), multiplicative Eilenberg–Moore (§0.3), absolute
logarithmic Witt theory (§5.2a), early Chern and Lang comparisons (§§1.8–1.9),
Geisser–Levine and approximation (§5.17), and the space-level local splitting
(§§0.4–0.5,6.12). Their targets, hypotheses, Checks and locators were not cut.
The earlier seventh finding was supplier order, now R1 above. The review report
`REV-PKG-KTheoryFiniteLocalFields~codex.md` retains its detailed checks and
accepted-plan coverage map; this fix does not purport to repeat that whole
review.

Package citations now use roadmap names and sections throughout, removing the
earlier PR-number references. Frozen provenance is recorded here instead. The
only Lean edit explains the two new supplier citations in the existing comment
about missing carriers. No Lean declaration or variable block changed.

## Frozen supplier and exact consumption

Read-only source: [HermitianKTheoryOfPoincareCategories README at
5ee945adff96bc409c28cb29ac430eb77c79df8f](https://github.com/TauCetiProject/TauCetiRoadmap/blob/5ee945adff96bc409c28cb29ac430eb77c79df8f/TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md),
the authorized head of upstream draft PR #1266. SHA-256 of the decoded README:
`3e76a78d478c7a6c785e79b2e87ebea58ee97ae18140982431eec1d482109973`.

| Consumed requirement | Export read | Coverage in this package |
| --- | --- | --- |
| Coherent products and unit for Ξ, for every commutative ring | §7.10, `finite-even-multiplicative-l-tate`: commutative Poincaré algebra object, separately exact tensor and coherent multiplication/unit; lax symmetric monoidal K, GW and L and unital E∞ comparison | The exact contract retains these conditions and specializes to perfect complexes with untwisted symmetric duality. §1.7 applies it to every q=2^f, f≥1. |
| Same additive comparison and square | §7.10 identifies the underlying Ξ with the GW→K-homotopy-fixed→K-Tate factorization through L, and refines the cartesian square | No new additive comparison is substituted for the existing supplier. The ring target refines that map. |
| Fundamental fibre sequence and its actions | §7.10 supplies the GW-module sequence K-homotopy-orbits→GW→L, with forgetting/bordification actions and module-linear norm/hyperbolic maps | Both the exact contract and §1.7 retain compatibility after forgetting multiplicative structure. |
| Module coefficients | §7.11, `multiplicative-l-tate-base-change`: P an A-module Poincaré category with separately exact action; Ξ_P linear over L(A) through Ξ_A; fundamental square and sequence in GW(A)-modules | Coefficient lines and every integer shift stay specified. Twisted/shifted theories are used as modules; they are not assigned an independent unit. |
| Base change | §7.11: compatible algebra map and exact Poincaré functor give semilinear naturality coherent for identities/composites, and compatible relative-tensor comparison maps | Derived extension is required for arbitrary ring maps. The contract does not assert that scalar-extension comparison maps are equivalences. |
| Exact L.1 target | Packet node `L.1/finite-even-multiplicative-l-tate-comparison` asks for the graded ring identification with F₂[x,x⁻¹], degree x=2, using Qˢ | §1.7 supplies this application, including unit, invertibility, grading and uniqueness of the nonzero degree-two class. The general E∞ construction is imported, rather than duplicated here. The packet is unchanged. |

## Adversarial pass on touched statements

The following are mathematical checks of the roadmap statements, not new
formal proofs. Cases outside a statement's hypotheses are recorded as such.
The high-level Poincaré and spectrum carriers are absent at the pins, so these
Checks belong in the README rather than artificial Lean encodings.

| Statement or interface | Instances and computation | Result and change |
| --- | --- | --- |
| General multiplicative supplier | R=Z, F₂ and F₃; characteristic two does not make 2 invertible. Perfect complexes have the separately exact tensor needed by the stated algebra-object contract. | No field, finiteness or invert-two hypothesis added to the general export. Only the Laurent calculation is finite-even. |
| Rank-zero/unit degeneracy | Zero Poincaré category and zero module category give zero K, GW and L spectra; the square and sequence are zero. The zero ring has 0=1, so its unique ring map is unital in that sense. | No nonzero-unit assertion is applied to this case. The README includes the zero-module check; the frozen supplier includes the zero-algebra check. |
| Finite-even range | f=1 gives q=2; f=2 gives q=4. f=0 gives q=1, which is no field. q=3 is a field but not in this characteristic-two calculation. | Retained f≥1 and the existing odd-q warning; added q=1 negative control. The general supplier still applies to F₃. |
| Laurent unit and generator | In degree zero, the unit is the nonzero class of the symmetric line. In degree two, invertibility forces a nonzero image, hence the unique nonzero element x. Degree −2 is then x⁻¹ and x·x⁻¹=1; degree 2n follows for every integer n, including n=0,1,2 and negative n. | The proof in §1.7 now uses unitality, grading and invertibility explicitly. It is not a claim about arbitrary ungraded ring endomorphisms. |
| Negative controls on the same map | x↦x² preserves a unit but sends degree two to degree four; the zero additive map sends 1 to 0. | Both fail the required map structure. These controls are README Checks. |
| Extension versus transfer | For F₂→F₄, extension keeps a rank-one form rank one, so π₀ sends 1 to 1. Write α²=α+1: Tr(1)=0, Tr(α)=Tr(α²)=1. Trace transfer of the unit pairing has matrix [[0,1],[1,1]] on (1,α); the first basis line is Lagrangian, so the Witt class is zero. | The README now names trace transfer and gives this two-dimensional witness. It does not treat extension as transfer or assert transfer is unital. |
| Identity/composite base change | d=1 gives the identity field map; composing inclusions of degrees d,e gives degree de. Each sends x to the unique nonzero class of degree two and 1 to 1, so the normalized homotopy-ring maps agree under composition. | Naturality of the spectra and modules is imported with its coherent identity/composition structure from §7.11, not inferred from these homotopy-group checks alone. |
| Products versus an additive identification | F₂×F₂ has e₁e₂=0 and e₁+e₂=1 for its two coordinate idempotents. The additive automorphism (a,b)↦(a,a+b) sends (1,1) to (1,0), so is not unital. | The general-ring contract preserves these products and unit. The product Check prevents an additive equivalence from being silently promoted to a ring equivalence. |
| Nonflat base change and sign | Z→F₂ is nonflat. Derived extension nevertheless takes a finite projective complex to a perfect complex. The line with pairing −1 becomes the unit pairing; the coefficient involution −1 becomes +1. An integer shift remains the chosen shift. | The README requires derived extension and retains the coefficient/shift data. No flatness, scalar-extension equivalence or new shifted ring unit is asserted. |
| Forgetful compatibility | The supplied factorization has source GW and target K-Tate via L. For zero categories every map is zero; for F₂ the symmetric line is nonzero while the hyperbolic plane is Witt-zero. | The underlying Ξ, norm, hyperbolic map and fundamental fibre sequence keep their stated directions and actions. The original bilinear Checks are preserved. |
| Supplier-order graph | GeneralAlgebraicKTheory→GeometryOfNumbersAndQuadraticArithmetic→HermitianKTheoryOfPoincareCategories→§1.7; motivic §§1.5–1.6,4.4,6.6,7.4–7.5,8.1–8.7,10.3–10.6 feed the field branch, while its §11.1 consumes §2.1 separately. | R1 is recorded without importing the downstream real-place application into its own rigidity input. The trace branch still constructs absolute Witt locally and imports general cyclotomic theory. |
| Existing Lean generality and witnesses | The tame coordinate still has an arbitrary commutative ring and actual units with integer valuation exponents; maximal divisibility still uses actual additive subgroups of an arbitrary abelian group. The four proved examples are unchanged. | No new hypothesis-free quantified data, weakened variable block, fabricated carrier or sorry'd data definition was introduced. The only added Lean text names the supplier. |

No compactness, DVR, unit-ideal or finite-rank hypothesis is introduced by these
edits. Those hypotheses in other targets are unchanged. The zero, characteristic
two, rank-one form, degree-zero, negative-degree and nonflat cases above are the
applicable degeneracies of the changed interfaces.

## Sources, library limits and preserved gaps

Read Calmès et al., *Hermitian K-theory for stable infinity-categories II*,
[arXiv:2009.07224](https://arxiv.org/pdf/2009.07224), Corollary 4.4.13, p.107,
for the additive square and fundamental sequence. Read part III,
[arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4), Proposition 3.1.4,
pp.50–51, Remark 3.1.5, p.51, and Remark 3.1.6, pp.51–52, for the finite-even
comparison, the multiplicative attribution and the perfect-field extension.
The part III PDF read has SHA-256
`1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`.
Remark 3.1.5 points to Paper IV for the multiplicative refinement. That proof
was not read or certified in this fix; the issue expressly assigns it to the
authorized supplier export. No source passage is reproduced here.

Re-read the package's reviewed library-coverage entries. The targeted current
roadmap/library audit used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current TauCeti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches in the nine newer
roadmaps' Suggested files (including the OperatorTheory subroadmaps), the four
named Completed roadmaps and current TauCeti found no competing higher
Poincaré/GW/L/Tate-spectrum interface. DifferentialGeometry's Poincaré matches
are de Rham statements, not this construction. Existing classical Witt and K₀
ownership remains cited. No upstream file was changed or built. This was a
targeted check of the touched interface, not a new audit of all 102 baseline
signatures.

All **39 recorded source-proof gaps and 34 requests** remain unchanged in the
packet. Its 280 target nodes and 102 baseline declarations are unchanged too.
The preceding independent review's 39-boundary ledger remains the source for
their precise limits. Acceptance here resolves R1/R2 at roadmap-package level;
it neither marks those source proofs checked nor changes the implementation
status. No restricted book was used. No suspicious instruction was encountered
in the fetched source or supplier data.

## Validation and restart information

- `lean-check research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  exit 0 at Mathlib `082e2d3` / TauCeti `f790474`; exactly 18 warnings, all
  `declaration uses sorry`, and no errors or other warnings. Available memory
  exceeded 20 GB before compilation. The file has 209 lines, two real data
  definitions and four proved examples; all declarations are unchanged.
- `mech_check`: exit 0; 21 counted declarations, 77 bold targets, 56 backticked
  identifiers, no absent identifiers/labels and no round-named labels. Its five
  empty-section notices reflect layers with no pinned high-level carriers;
  its seven unnamed-bold notices are the Summary and six API prose labels.
  Neither calls for invented Lean definitions.
- `depcheck --candidate … --only KTheoryFiniteLocalFields`: exit 1, with only
  `NOT IN ORDER.txt: KTheoryFiniteLocalFields (add it after its last supplier)`.
  The issue explicitly directs that this registration line be ignored until
  port time. No cycle or upward-dependency warning was reported.
- `scripts/check_blueprint.py`: exit 0, zero errors and zero warnings, with
  all counts above preserved. `scripts/check_sorry_data.py`: exit 0.
- Intake `check-files`, JSON parsing, preservation checks and `git diff --check`
  pass for the four authorized deliverables. All 254 original Check bullets and
  103 headings are preserved; there are now 257 Check bullets. Removing Lean
  comments leaves byte-identical code, and the packet is byte-identical. No PR
  numbers remain inside the package; no packet, order file, metadata or upstream
  file changed.

No unfinished obligation or checkpoint remains for this fix. At port time the
maintainer still registers the package in the order tooling, as authorized by
the issue. Future source-proof work should resume from the unchanged packet
gap ledger rather than treating this supplier repair as a proof audit. Scratch
downloads and logs are disposable; the frozen URLs, hashes, limitations and
results needed by the next worker are recorded above.
