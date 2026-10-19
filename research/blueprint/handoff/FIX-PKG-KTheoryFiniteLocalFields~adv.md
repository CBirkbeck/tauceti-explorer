# FIX-PKG-KTheoryFiniteLocalFields~adv — checkpoint

Issue #11016. Agent Codex; session `codex-nzsLMX`; 19 October 2026.
The claim bot confirmed this session's claim. This submission repairs the
package and records **needs_changes**, because the authorized upstream
layer/bundle order is still absent. This is the worker's disposition of the
fix, not an independent review of its own work.

## Remaining blocker and where to resume

`upstream/CaraianiNewton.md` assigns neither KTheoryFiniteLocalFields nor an
upstream bundle for its foundational K-theory dependencies. WORKERS requires
packages to use upstream roadmaps, their bundle, or lower tiers. An open atlas
package and a requested export do not themselves satisfy that order. This
issue permits edits only to this package and this handoff; it does not authorize
changes to the order file, supplier packages, or upstream PRs.

The maintainer must assign an order/bundle covering StableHomotopyKTheory,
RefinedTraceMethods and MotivicEtaleKTheory, and this roadmap's relevant layers,
with their actual foundation dependencies. In particular:

1. GeneralAlgebraicKTheory §§13.8a–c supplies the finite-field theorem first.
2. Our Layers 0–1 refine that result; our Layer 2 proves the needed rigidity.
3. MotivicEtaleKTheory M.7 consumes that rigidity; our §6.6 subsequently consumes
   its general local étale comparison. M.8 is not an input to our Layer 1.
4. Independently, GeneralAlgebraicKTheory feeds
   GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10, then our §§1.7,6.13.
5. The absolute Witt/trace branch precedes the odd-prime local comparison.

This is a proposed mathematical layer order, **not an authorized tier change**.
A whole-roadmap ordering alone will not express the M.7/Layer-2 relation;
register a suitable bundle or authorize a split/move of the relevant exports.
After routing, recheck the live supplier heads and mark the fix accepted only
when every consumed foundation has the required upstream status/order. Do not
restore the duplicate Brauer or finite-even hermitian proof.

## Finding → change

| Prior review finding | Repair and disposition |
| --- | --- |
| Completion and continuous Adams | Consume GeneralAlgebraicKTheory #1212 §§13.8a–c for finite-group Atiyah–Segal, integer operations, standard Brauer lift and Quillen's theorem. Delete the duplicate standard proof. Add §0.1 compact augmentation-kernel and stable lim¹ targets, and §0.2 unit Adams operations at every prime, including two. Keep integer and profinite changes distinct. Mathematical contracts supplied in this package; upstream order remains subject to the blocker. |
| Eilenberg–Moore | §0.3 now states the simply connected, degreewise finite-type field-coefficient pullback theorem, two-sided bar, products/signs, edge maps and strong convergence. It is not assigned to an exact-couple construction. |
| Absolute log Witt | §5.2a constructs the initial absolute complex for arbitrary prelog ℤ_(p)-algebras, with initiality API, level one, standard filtration, operator relations and ordinary/relative comparisons. The DVR-only divisibility assertion remains restricted. |
| Early Chern and Lang | §1.8 constructs universal equivariant classes, Moore-Hurewicz/slant operations, mixed unit/Bott formula and independently normalized finite-field edge. §1.9 constructs the Lang torsor, prime-to-characteristic classifying-topos spectral sequence and low-degree Sp/SL comparison. Neither consumes M.7 or M.8. §6.6 is the later local descent comparison and must agree with the early normalization. |
| Geisser–Levine and Popescu | §5.17 adds field p-torsion freeness, motivic concentration, K/log-symbol and Zariski-sheaf comparisons. It consumes SchemeAndStackFoundations §0.15 for Popescu and passes through finite-length colimits before inverse limits, controlling lim¹/error terms. §6.11 consumes this trace theorem once. |
| Space splitting | §§0.4–0.5 and 6.12 now expose the intermediate machinery: height-one functor and excellent-module realization; transfer completion; root maps and actual retraction; cyclotomic comparison; local Iwasawa module and freeness; actual periodic splitting; positive truncation; rank and valuation fibre. The final Dwyer–Mitchell splitting theorem is an output. No equality-of-homotopy-groups shortcut. These remain mathematical roadmap targets, not proved Lean constructions. |
| Authorized order | **Unresolved**, as above. The specific finite-field/hermitian cycle in the old review no longer exists in the checked upstream heads: #851 consumes #1212, not this roadmap's finite-field calculation. That repair does not invent a tier or legalize the other atlas-only suppliers. |

The earlier review's corrections are retained: tensor over ℤ before coefficient
reduction; degree-two orbit cokernel and dlog class; DVR restriction on higher
form divisibility; dyadic ℚ₂ coefficient extension ℤ/4; signed Chern factorial;
actual Tate-module carrier/API boundary; general hermitian ownership; and
explicit small-field, rank-zero and zero-ring controls.

The old Layer-1 §§1.3–1.7 standard construction is now an imported contract.
Remaining sections are renumbered: old operations 1.8 → 1.5, coefficient closure
1.9 → 1.6, hermitian 1.10 → 1.7, symplectic 1.11 → 1.9. New 1.8 is the early
Chern construction. Internal references were reconciled; source section numbers
retain their source meanings.

## Supplier and library audit

Read both README and suggested declarations of the open upstream packages,
not just their PR descriptions. Heads checked:

| Supplier | Checked version and boundary |
| --- | --- |
| GeneralAlgebraicKTheory #1212 | `b1b14e6940e291d60379dcc65fb22674f63fa176`; §§13.8a–c supply the standard finite-field route and finite-group completion. They do not state our compact kernel, continuous unit action or Eilenberg–Moore refinements. |
| GeometryOfNumbersAndQuadraticArithmetic #851 | `01c64f0cc5f154a3d190697951ead2fffc2af693`; §§6.8a–6.10 own general Poincaré GW/L, localization and finite-vcd₂/finite-even homotopy limits; imports the finite-field answer from GeneralAlgebraicKTheory. |
| TopologicalKTheory #894 | `f2c908debdefa440e7dfda339a54cb3b74cdc51c`; supplies KU/Bott/integer operations, not the new completed-operation or pullback contracts. |
| CrystallineCohomology #857 | `6f725a8b808f96e08ca80db88cee0ef598d03d37`; CR.4.6 is relative Wₙ-linear, not the absolute prelog initial object. |
| EtaleCohomologyFoundations #938 | `d4865f2ea953651ee8991076ef0e503bed478fca`; §0.9 normalized projective-bundle/first-Chern and the general étale machinery are consumed. |
| SchemeAndStackFoundations upstream main | `c785fa3b983754f0dbcc49492d92fd770e3adba6`; §0.15 explicitly supplies the two Popescu exports. This is newer than the runner's read-only roadmap snapshot. |
| AlgebraicKTheory #1142 | `7ecab00a30fddb0f594c087038b2c8242cd881c7`; low-degree determinant/localization interfaces checked. |

Read the current Tau Ceti library and the current read-only roadmaps, including
the added roadmaps absent from the atlas snapshot. Current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the read-only roadmap snapshot was
`0d144d044dacebca17b654695b6f1ad58f159b27`. No builds ran in either tree.
`completedGroupAlgebra`, `proj`, `of`, `map` and `powerSeriesCoordinate` already
exist under `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra` and are used
by ProfiniteProPGroups Layer 9. The README consumes them, preserving the
infinite-procyclic-pro-p/topological-generator hypotheses; it does not propose
a second carrier. Searches did not find the needed height-one realization,
Burnside completion or absolute log-Witt foundations already exported there.

The Lean baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

## Adversarial pass for the touched statements

The rows cover the new definitions, their APIs and identities, and the modified
consuming statements. A pass means the proposed statement survived these checks;
it does not certify a formal proof or remove the order blocker.

| Statements/API checked | Boundary or computation | Disposition |
| --- | --- | --- |
| §0.1 compact recurrence and augmentation kernel | ℤ₂ with ×2 has solvable recurrences despite nonsurjective maps; ℤ with ×2 has nonzero lim¹. G=1 leaves discrete rank ℤ. For C₂, I²=2I and the kernel completion is ℤ₂. | Compact kernel plus constant rank, not compactness of the whole representation completion; both Milnor degrees retained. |
| §0.2 continuous Adams | u=−1 gives weights −1,+1 in degrees 2,4; u=1 is identity; nonunit u=ℓ cannot act on invertible Bott. ℤ₂× is not procyclic. | All primes allowed; continuity only on fixed finite stages/coefficients. No unjustified unique coherent-action claim. |
| §0.3 Eilenberg–Moore | ΩK(ℤ,2)=S¹ gives Tor degree (−1,2), total degree 1. Identity pullback recovers X. BU×BU is finite type in each degree, not finite total dimension. ΩS¹ is disconnected. | Correct degree/sign, degreewise finiteness and simply connected base; no natural filtration splitting. |
| §0.4 localization/realization | Zero/free modules, redundant resolution and direct sums; a one-relation module requires a fibre because KU cohomology is contravariant. Φ(point)=Φ(Ω∞₀Hℤₚ)=0. | Projective dimension and Λ′ action retained. Tₖ has π₀=π₋₁=ℤₚ; connected zero-space comparison is distinct from a connective spectrum identification. |
| §0.5 transfer foundation | Orbit and augmentation tests in that section; no ordinary KU-completion substitution. | Explicit prerequisite targets added after reading the original proof; used only by §6.12. |
| Imported finite-field theorem and §1.3 changes | q=2 has K₁=0 but K₃=ℤ/3; q=5 determinant generator; finite eigenvalue automorphism need not be a global profinite operation. | Standard theorem imported once; refinement retains the actual completed operation and Frobenius homotopies. |
| §1.4 relative normalized classes | q=4,ℓ=3 gives degree-one Bockstein of positive sign; q=2,ℓ=3 or 7 gives first odd classes in degree 3 or 5. GL₂(𝔽₂) is not stable. | Tor generators and transgression/Bockstein normalization explicit; no multiplicative extension assertion at two. |
| §§1.5–1.7 moved consumers | Restriction/transfer degree-zero exception; defining-characteristic finite-field positive groups vanish, K₀ remains; arbitrary perfect characteristic-two extension differs from the supplied finite-even case. | Existing hypotheses and checks retained; no duplicate supplier proof. |
| §1.8 universal Chern/Moore construction | Trivial representation, stabilization, determinant/Kummer; degree-two even coefficient quadratic correction. | Not a universal group homomorphism at the exceptional degree; uses Moore-Hurewicz before slant evaluation. |
| §1.8 products/finite edge | 𝔽₇/mod 3, weight 2 detects the minus sign; 𝔽₃/mod 2, weight 3 detects 2!=0. In 𝔽₅, a=2 has nonzero square class while ζ=−1 is a square. | Signed factorial kept; a coefficient root is not assumed to generate the Kummer quotient. ℚ₂ Bott order four does not justify arbitrary β². |
| §1.9 Lang and Sp/SL | r=1 is identity, r=0 excluded; q=3,5 give integral multiples 8,24 of c₂; Gₘ Lang map is x^(q−1); a disconnected constant group may fail surjectivity. | Coefficients prime to characteristic explicit, actual classifying-topos/edge map constructed. Sign fixed before mod-two reduction. Odd H₂ exceptions at q=3,9 retained. |
| §5.2a log-Witt initiality and operators | Level one, ordinary/unit log structure, DVR dlog, characteristic-p two-variable dx∧dy, absolute dV(1) versus relative linearity. | Arbitrary prelog ℤ_(p)-algebras allowed for existence; higher-form divisibility stays DVR-only. Relations FV=p, FdV=d, dF=pFd, Vd=pdV and projection formula have consistent source/target levels. |
| §5.2a filtration | Fil⁰=whole, Filⁿ=0, quotient by Filˢ has Witt length s; dV contribution essential. | Differential graded ideals, R/F/V shifts retained; no false multiplicative index-addition claim. |
| §5.17 characteristic-p K comparison | Perfect field positive forms vanish but K₀/p^ν=ℤ/p^ν; 𝔽ₚ(t) has nonzero dlog t and zero Ω². | All-field p-torsion freeness separated from perfect-field vanishing; sheaf comparison is not a global section theorem. |
| §§5.17,6.11 Popescu and trace | 𝔽ₚ[[t]] regular but not finite type; dual numbers singular. R−F has same form degree, including degree zero. | Finite-length colimits first, inverse limits later with lim¹ control. GH06 printed degree n−1 in the intermediate codomain is not propagated. |
| §6.6 and §7.4 Chern consumers | Dyadic K₂(ℚ₂;ℤ/2)=ℤ/4, not two split ℤ/2 terms; weight-three mod-two Chern need not be an edge isomorphism. | Early construction precedes rigidity; local descent range and its normalization are later. Completion/unramified maps preserve their invertibility hypotheses. |
| §6.12 root maps and retract | Work at finite nontrivial μ, p-localize all zero spaces; invert p, not the auxiliary prime; roots map to L(μ), not necessarily L. | Section and both composite homotopies are explicit. No infinite-loop structure inferred for the original zero-space section; Φ constructs localized spectrum maps. |
| §6.12 Iwasawa module/periodic splitting | Underlying rank alone cannot realize an equivalence; preserve Γ′ action, inverse dual action and twists. | Establish free/projective module decomposition and realize it; final splitting theorem is output. |
| §6.12 positive truncation | Periodic Tₖ∨ΣTₖ has π₀=ℤₚ², while K₀(L;ℤₚ)=ℤₚ. For ℚ₅(ζ₅), r=1 gives k=g⁴ and order-five π₁(FΨ). | Compare τ≥1 and restore rank separately; no τ≥0 spectrum equivalence. |
| §6.12 valuation fibre | Valuation can be nonzero on the BFΨ circle; uniformizer makes the functional primitive on d+1 free directions. For ℚ₃, d=1 leaves SU and no U factor in the integer ring. | Actual circle sections and GL_(d+1)(ℤₚ) change of basis justify the space fibre, with choice dependence stated. p=2 excluded. |
| Lean tameCoordinate | (unit,π)→2, (π,unit)→3 in 𝔽₅; two π→4, valuation (−1,1)→4; changed π→same 2; characteristic two and zero ring→1. | General swap/change/multiplication signatures unchanged. Two proved examples; remaining boundary checks are named targets listed in the README. |
| Lean maxDivisible | ℚ all divisible; finite exponent six forces zero; ℤ reduced; ℚ×ℤ/6 retains exactly its rational factor. | Uses actual divisible subgroups, not unrelated ambient divisions. Two proved examples; product, functoriality, quotient/complement and finite-group signatures retained. |

## Sources and limits of this pass

Read the cited source statements at the linked versions in the README, including
the proofs needed for the new target breakdown. New/expanded checks include:
Atiyah–Segal Theorem 2.1 pp.3–4 and Proposition 4.2 p.10; Baker §2 pp.3–4;
Eilenberg–Moore Theorem 12.1 p.220 and §16 pp.227–230; Bousfield Theorems 2.1
and 2.3 p.3 and §§4–6 pp.17–30; the Dwyer–Mitchell module, root-lifting and
local-field results with the precise author-manuscript locators in References;
WeibelChern §§1–3 and Proposition 5.1 p.24; Quillen's ICM §2 pp.48–50;
HM03 Definition 3.2.1 through Lemma 3.2.4 pp.47–49; HM04 pp.2,4–5;
Geisser–Levine Theorems 1.1,8.1,8.3 pp.460,489–491; and GH06 Theorem 3.1
p.19. The original DFM author manuscript was also obtained and its relevant
statement/proof read; §0.5 records the newly exposed prerequisites.

The source statements identify roadmap targets, not implemented results.
The existing packet's 39 explicit source-proof gaps were **not** edited or
claimed closed. Their ledger and the prior review's 15-locator sample remain in
`reviews/REV-PKG-KTheoryFiniteLocalFields~adv.md`. This fix's new source pass is
on the touched statements; it does not misreport a fresh full-source review of
every unchanged Layer-4/5 calculation. No book passages or source extracts are
included in this submission.

## Lean shape and validation

Suggested.lean has two light real-bodied definitions, four proved examples
(two per definition), eleven general theorem targets and seven named boundary
targets. It uses `import Mathlib` and the actual Tau Ceti K₀ module. New
homotopy, Witt and K-theory carriers stay in the README. No sorry'd data,
auxiliary development, language server or library build was introduced.

- `lean-check research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  exit **0**, exactly **18** `sorry` warnings, no other warnings or errors.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`:
  **PASS**, 280 nodes, 39 recorded gaps, zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`:
  **PASS**.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables:
  **PASS**.
- `git diff --check` and JSON parsing: **PASS**.

Only README.md, Suggested.lean, review.json and this handoff are changed.
Resume with the authorized dependency order described above; retain this
checkpoint's mathematical repairs and revalidate against the live suppliers.
