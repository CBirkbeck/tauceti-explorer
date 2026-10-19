# PKG-KTheoryFiniteLocalFields~codex — completed package

Codex, session `codex-WVLTdb`; issue #10749; 19 October 2026. The bot confirmed the claim in issue comment 6266951743. This is the one package requested by the issue, not a checkpoint and not an implementation of the planned K-theory.

## Deliverables and validation

The three package files are `research/blueprint/packages/KTheoryFiniteLocalFields/{README.md,Suggested.lean,metadata.toml}`. The README carries all seven layers in the prescribed prose form, every definition/construction's API and discriminating Checks, exact supplier contracts, hypotheses, source locators, examples and dependencies. The metadata category is `math.KT`. This note is the fourth and only other changed path. The accepted packet, reader and original suggested catalogue were inputs and are unchanged.

`Suggested.lean` has two real-bodied light definitions: `Tame.tameCoordinate` over units of an arbitrary commutative ring, and `Divisible.maxDivisible` for an additive abelian group. It states three coordinate identities and eight divisible-subgroup targets, with six coordinate examples and four divisible-subgroup examples. All six coordinate examples have actual proofs; the planned theorems and divisible-group examples use `sorry`. The closing comment names the heavy constructions absent at the pins. No invented K, spectrum, cohomology or log-Witt carrier, sorry'd data, `True` conclusion or conclusion-as-hypothesis is used.

Validation completed before submission:

- `lean-check research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean`: exit 0; 15 warnings, all exactly “declaration uses sorry”; no other warnings or errors. The existing shared pinned build was used; no project, cache, language server or library build was started. Available memory exceeded 20 GB. The final change after this check is README prose only.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`: 0 errors, 0 warnings; 280 nodes, 26 definitions/constructions, 209 API entries, 117 input tests, 39 recorded gaps, seven planned stages and zero closed stages. The check does not certify mathematical closure.
- The final intake path/size/format check and whitespace check are recorded in the pull request. README is within the issue's 50–200 KB limit; Suggested.lean is 180 lines, well below 5,000.

## Input coverage

The package reorganizes the accepted targets by mathematical build order, rather than retaining the catalogue scaffold. These ranges refer to the zero-based order of `nodes` in the unchanged accepted packet; they make it possible to audit coverage without importing target ids into the README.

| Input nodes | Package location and treatment |
| --- | --- |
| 0–2 | §§1.1–1.2: coefficient cofibres/products and normalized Bott class |
| 3–9 | §§1.3–1.4: Brauer character, Green integrality, virtual lift and its operations |
| 10–13 | §§1.5–1.6: Adams fibre, lifting and Quillen map |
| 14–21 | §1.7: normalized cohomology, detection, stable acyclicity, plus equivalence, group calculation |
| 22–33 | §1.8: operations, tensor-square supplier, transfer/restriction, determinant and symbol comparisons |
| 34–38 | §1.9: finite coefficients, algebraic closure and derived completion |
| 39–41 | §2.1: henselian-pair rigidity and its completed form |
| 42–44 | §2.2: localization, signs and coefficient section |
| 45–49 | §2.3: integral divisibility, canonical torsion section and odd localization |
| 50–52 | §2.4: parameter change and the four-element polynomial-base module |
| 51,53–55 | §2.5: prime-to-p local groups, twists and e-invariant |
| 56–58 | §3.1: full norm-residue symbol and exponent/primary projections |
| 59–63 | §3.2: reciprocity, tame coordinates and norm criterion |
| 64–66 | §3.3: section, kernel and integer-ring localization |
| 67–71 | §3.4: all-prime divisibility and the separate torsion theorems |
| 72–76 | §3.5: uncountability, canonical Moore decomposition and wild integer-ring torsion |
| 77–78 | §4.1: linear Waldhausen THH and its cyclotomic structure |
| 79–81,85 | §4.2: classical TR/TC, operators and Witt π₀ |
| 82–83 | §4.3: Connes operation, η correction and the Hℤ/m-module splitting |
| 80,84,86–88 | §4.4 and §4.8: norm/orbit sequences, connectivity, modern comparison |
| 89–93 | §4.5: comparison with existing algebraic Tate, cyclic product/sign, multiplicative Tate filtration |
| 94–102 | §4.6: signed 3×3 chase, homotopies, McCarthy additivity and Waldhausen fibration |
| 103–107 | §4.7: specialized resolution, END criterion and torsion-complex comparison |
| 108–111 | §4.8: logarithmic DVR spectra and localization/trace square |
| 112–115 | §5.2: coefficient-ring presentation, ghosts and Witt congruences |
| 116–118 | §5.3: residue coefficient map, modified V and its basis/product rules |
| 119–124 | §5.4: log differentials, residue sequence, ramification and perfect-field HH |
| 125–127 | §5.5: twisted derivation, hW and restriction/divisibility |
| 128 | §5.6: mod-p log-Witt basis, all relations and module products |
| 129–131 | §5.7: log trace maps and differential graded structure |
| 132–133 | §5.8: ordinary DVR THH, tame/wild mod-p presentations |
| 134–137 | §5.9: log THH, κ, completed groups and tame homotopy-fixed descent |
| 138–145 | §5.10: log-Witt comparison and ordered low-degree/Bockstein argument |
| 146–148 | §5.11: normalized unit/α coordinates and TR Bott classes |
| 149–155,157–158 | §5.12: reduction, permanent representatives, logarithmic derivative and all-level Γ comparison |
| 156,159–162 | §5.13: first and higher Tate differentials, pages and surviving bases |
| 163–169 | §5.14: Frobenius surjectivity, dimension, Bott carries, pro-comparison and root torsion |
| 170,174–175 | §5.15: TC/cohomology, finite-Witt-algebra trace and local trace |
| 171–173 | §5.1: perfect-field THH/TR/TC |
| 176–181 | §5.16: monoid/cyclic-bar/truncated-polynomial calculation |
| 182–189 | §5.17: twisted TR, regular/characteristic-zero relative K, and TR/TC limits |
| 190,193–194 | §6.1: maximal divisible subgroup, criterion and lattice lemma |
| 191 | Supplier contract: use current `TauCeti.TateModule`; no new carrier |
| 192 | §6.2: ordinary-completion/Tate-module exact sequence |
| 195–197 | §6.3: local w-invariant evaluations using supplied cyclotomic character |
| 198–201 | §6.4: finite, continuous and divisible cohomology, including coefficient maps |
| 202 | §6.5: valuation-ring/field comparison above degree one |
| 203–205 | §6.6: Dwyer–Friedlander comparison, early edge and exact filtration, all-prime finite-local case |
| 206–211 | §6.7: completed/discrete groups and small-prime/unramified examples |
| 212–219 | §6.8: integral torsion, Bockstein filtration, divisible ranks and lattice |
| 220–221 | §6.9: kernels, cokernels and density of integral-to-completed maps |
| 222–228 | §6.10: independent symbols, finite relation descent, transfers and Milnor summand |
| 229 | §6.12: odd-prime homotopy splitting with virtual rank |
| 230–235 | §6.11: equal-characteristic Witt, completed and integral answers |
| 236 | §7.1: completion maps and coefficient versions |
| 237–241 | §7.2: restriction/transfer, local boundary and Karoubi square |
| 242 | §7.3: completed Hilbert symbols and torsion detection |
| 243–244 | §7.4: Chern/edge naturality and unramified integral image |
| 245 | §7.5: trace and completion |
| 246 | §7.6: semilocal map above p |
| 247–253 | §5.1: NS prime-field filtration, TC⁻/TP, Frobenius and cyclotomic shift |
| 254–264 | §1.10: even finite/perfect fields, symmetric L/Tate/GW and classical connective comparison |
| 265–268 | §6.13: dyadic fields/integers, 2-adic and integral full-spectrum assertions |
| 269–279 | §1.11: compact/Lang comparisons, small-rank H₂, Hurewicz, Bott/Chern and finite-rank Sp |

## Ownership, duplication and order

Read the two upstream exemplars AlgebraicTopology and GrothendieckEulerForms, the prescribed approved exemplar, the accepted packet/reader and relevant existing supplier contracts. Baseline audit used the 102 cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; declaration statements were read, not accepted on spelling alone. The Lean import of `TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace` and its `finrankEquiv` actually elaborates at those pins.

The separately supplied current read-only roadmap revision was `0d144d044dacebca17b654695b6f1ad58f159b27`. The current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its Mathlib dependency differs from the elaboration pin, so current-only declarations were not assumed available to Suggested.lean. Mathematical-object searches included all nine post-snapshot roadmaps and the Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts packages, as well as the library. No lake command ran there.

Duplicate targets removed or converted to consumption:

| Object/input | Existing owner consumed |
| --- | --- |
| Field K₀/dimension | `TauCeti.SplitK0.finrankEquiv`, `TauCeti.AbelianK0.finrankEquiv`; GrothendieckEulerForms owns the general construction |
| Integral virtual-character lattice and its faithful character | `TauCeti.repRing`, `repRingCharacter`, `virtualCharacters`, existing representation K₀/base change; InductionRestriction Layer 6 owns Brauer characterization |
| Finite-field algebra/Frobenius/norm/GL count | Mathlib finite-field, Galois, norm and `Matrix.card_GL_field` APIs; local cohomological detection remains new |
| Witt carriers, ghosts, Teichmüller, F,V and truncation | Mathlib `WittVector`/`TruncatedWittVector`; only the DVR quotient calculations and HM comparisons are new |
| Hensel roots, residue roots, Teichmüller and valuations | Tau Ceti Henselian/local-field modules; LocalFieldsRamification Layers 0–2 |
| Completion field maps, residue equivalence and semilocal tensor algebra | Existing height-one completion modules; NumberFieldArithmetic Layer 5, especially §5.3's pure-tensor contract |
| Local Artin normalization, finite local duality, smooth coefficient finiteness and cd | Current ClassFieldTheory Layers 5–8; LocalGaloisGroups Layers 0,5–6 for cyclotomic image, rather than a second character |
| General algebraic Tate (co)homology | Mathlib `tateCohomology`, group homology/cohomology and Tau Ceti trivial-integral Tate H⁰ computation; §4.5 is specifically an HM resolution-model comparison |
| General additive Tate-module carrier (input node191) | Current `TauCeti.Algebra.Module.Torsion.TateModule`: compatible torsion families, projections, universal lift, functorial linear maps, topology and finite-rank criterion. Additional general exactness/bounded-exponent consequences are supplier API requirements, not a new carrier |
| Classical quadratic Witt rings/cancellation | Current QuadraticFormInvariants and library; characteristic-two symmetric bilinear Poincaré theory is stated separately |
| General Milnor symbols, determinants, K₁, norm and reciprocity | K2SymbolsBrauer, KTheoryLowDegrees and arithmetic suppliers; the local/Quillen comparison, rather than a duplicate definition, is retained |
| Generic W_i and w_i arithmetic invariant | ArithmeticGaloisDuality/ArithmeticKTheory foundation contract; §6.3 owns only the local evaluation used here |

No current higher-K, logarithmic THH/TR/TC, general maximal-divisible-subgroup or finite-field Brauer-lifting implementation was found. AlgebraicVectorBundles' K₀-related framework and DifferentialGeometry's ordinary differential-form notions do not supply these higher algebraic objects. Generic Tate modules in LocalGaloisGroups' tame relation sequence are a different object from T_p of an abelian group; neither is duplicated here.

**Order limitation:** `upstream/CaraianiNewton.md` orders only the CN94 set. It contains neither this roadmap nor most core K-theory suppliers, and provides no bundle/tier for them. The issue explicitly authorizes this priority-one package. This submission does not invent a tier or assert its external foundations have already landed upstream. A maintainer port must register the K-theory foundation order and the hermitian supplier before claiming the strict bottom-up import condition. The README uses exact mathematical contracts; the limitations below remain visible to the independent package review.

**Move down / break cycles:**

1. The finite-coefficient Chern product, degree-three homology comparison and étale edge needed in §1.11 cannot import all of MotivicEtaleKTheory Layer 8, whose regulator chain returns through Layer 2 to Layer 1. §6.6 is an early export, with an independent construction from motivic/étale, plus, Kummer and universal-operation foundations. General universal Chern classes remain M-owned; the minimal early M supplier must be registered and the later regulator pointed to that export. The §1.11 dependency uses only this early construction, not §6.6's later local-field theorem. No new stage id was invented.
2. Generic W_i theory must be exported from the arithmetic foundation before ArithmeticKTheory's local/wild-kernel application imports this roadmap. Only its local values are built here.
3. The elementary maximal-divisible algebra of §6.1 is independent of local K. Its use in §3.5 is this independent early sub-build, not a cycle through completed local groups.
4. The explicit THH truncation calculation (§5.16) is an independent appendix input to §5.12. Log-Witt spanning relations precede the Tate argument; their independence is established after §5.14. The n≤3 low-degree argument precedes Frobenius-surjectivity induction, preventing the original circular all-level argument.

## What the package does not establish

This package is complete as a specification, but the accepted plan has 39 explicitly recorded proof/source/supplier gaps. They are not 39 newly verified proofs and are not marked closed. The following maps each one to the retained target or contract and states the residual work. Gap numbers below are zero-based positions in the unchanged packet.

| Gap | Retained location | Exact residual boundary |
| --- | --- | --- |
| 0 | §1.7 | Original stable mod-p GL acyclicity proof, Quillen1972 §11, not obtained/read |
| 1 | §1.7 | Separate ℓ=2 detection and multiplicative argument; odd-prime graded commutativity does not prove it |
| 2 | §1.7 | Original Quillen abelian-subgroup and wreath detection, cyclic cup products and Cartan–Eilenberg proofs |
| 3 | §1.4 | Green integrality's elementary-subgroup reduction beyond the imported Brauer-characterization theorem |
| 4 | §1.6 | Atiyah–Segal was read for its completion input; the entire stable compact inverse-limit argument remains a supplier proof obligation |
| 5 | §1.7/supplier | Construction and convergence of multiplicative Eilenberg–Moore, not an automatic ordinary cohomology API |
| 6 | §§1.1,1.9 | Original Araki–Toda/Browder product/refinement proofs, especially exceptional small Moore moduli |
| 7 | §1.8/supplier | Hiller universality and representation-operation comparison, not just an automorphism of a cyclic group |
| 8 | §1.7 | Full independent reconstruction of all expository cohomology-generator calculations |
| 9 | §2.1 | Full Gabber rigidity proof beyond the checked statements and CMM reduction |
| 10 | §3.4 | Original Merkurjev mixed-characteristic p-torsion-freeness proof for U(E) |
| 11 | §3.4 | Independent characteristic-p K₂ torsion/Hilbert-90 proof; avoid the K-book's circular cross-reference |
| 12 | §§3.4–3.5 | Moore original proof unread; preserve the independent norm-residue/local-duality route and check it does not assume Moore |
| 13 | §4.1 | Construct the cyclotomic structure for the actual linear Waldhausen model and justify its modern comparison |
| 14 | §4.6 | Original specialized McCarthy/Bökstedt/Waldhausen/TT inputs, beyond HM's reductions |
| 15 | §§4.7–4.8 | END criterion, Morita and torsion dévissage in the linear model; ordinary stable-category localization cannot substitute |
| 16 | supplier/§5.5 | Initial log-Witt complex and level-one universal comparison need a complete log proof; HM03/HM04 cross-citations alone do not supply it |
| 17 | §5.8 | Original Lindenstrauss–Madsen ordinary THH proof not read |
| 18 | §5.9 | Completed logTHH odd formula in HM Remark2.4.2 requires its Bockstein argument; the remark is not a proof |
| 19 | §5.12 | Implement NS all-level propagation and coefficient induction: the specification now fixes i > −1 and uses the finite-Moore function-spectrum variant, with the degree-zero connectivity requirement; no unsupported Tsalidis shortcut |
| 20 | §§5.10–5.16 | Original FdV, normal integral bases, Lubin–Tate series, unramified/deep Tate induction and cyclic-polytope geometry inputs remain to implement |
| 21 | §5.15 | Continuity and perfect-field K-completion inputs behind HM97 TheoremD, beyond checked statement/scope |
| 22 | §5.15 | Perfect, possibly infinite residue-field Brauer residue and Artin–Schreier arguments, now explicit targets |
| 23 | §5.17 | Original twisted-TR perfect-field proof and regular TC sequence sources beyond the checked survey statements |
| 24 | §6.12 | Original Dwyer–Mitchell/Thomason homotopy splitting; agreement of π_* is insufficient |
| 25 | §5.15 | cd_p≤2 for the perfect infinite-residue mixed-characteristic scope; finite-local ClassFieldTheory alone is insufficient |
| 26 | §§5.15,6.6 | Coherent natural higher-ν even splitting not proved; exact sequence and abstract splitting suffice for the stated local classifications |
| 27 | supplier/§6.11 | Geisser–Levine characteristic-p theorem must be explicitly adopted by the motivic supplier |
| 28 | §1.11/supplier | Lang fibration, geometric classifying-group cohomology and compact/étale comparison; AV supplies a sketch, not the foundations |
| 29 | supplier/§§1.10,6.13 | HermitianKTheoryOfPoincareCategories is unregistered in this snapshot; register full Poincaré/GW/L, shift, Ξ and cartesian-square contracts |
| 30 | §§1.10,6.13 | Original finite-field classical/connective and finite-vcd₂ comparison proofs unread |
| 31 | §1.10/supplier | Hiller's arbitrary perfect-characteristic-two divisibility proof, rather than finite group-order reasoning |
| 32 | §6.13/supplier | Original dyadic Witt exponent proof and shifted L-localization supplier |
| 33 | §1.11 | Original finite classical Schur multipliers, with small-rank odd-order exceptions retained |
| 34 | §6.6/supplier | Register the independent early universal Chern export described above; do not restore the M8 regulator cycle |
| 35 | §5.2 | General Cohen/Witt residue-identity embedding and Eisenstein presentation, beyond finite-residue unramified fields |
| 36 | §§1.3,1.6/supplier | Continuous ℓ-completed Adams operations for every ℓ ≠ p, assembled for a global prime-to-p profinite change of Brauer embedding; residue-prime completion alone is insufficient |
| 37 | §4.3 | No verified ηd≠0 witness was found; the false inference from η≠0 is excluded, while d²=ηd remains |
| 38 | §§5.17,6.11/supplier | Precise Popescu smooth/essentially-smooth filtered-colimit foundation, with regularity and finite-level limit control |

Source statements with locators were checked against public author PDFs and original articles where obtained. The original proofs named in the last table were not silently declared read. No restricted library book was copied, and no source passage is present in the deliverables. The library index was checked; the public K-book author draft was usable independently of the cleared-book collection.

## Adversarial mathematics pass

Every target belongs to one of these families; hypotheses and defining properties were audited at that family's degenerate and boundary instances. These are mathematical checks, not claims of Lean proofs of the heavy roadmap. Where a carrier does not exist at the pins, the numerical normalization stays in README Checks and its construction in the closing Lean comment. The real light-carrier computations are actually proved in Lean.

| Statements/definitions checked | Instances tried and computed witness | Result or change |
| --- | --- | --- |
| Coefficients, Bockstein and products (§1.1) | m=1; zero ring; K₂(ℤ;ℤ/2)=ℤ/4; K₂(𝔽₃;ℤ/2)=ℤ/2 | Cofibre, not tensor; separate product hypotheses and exceptional moduli |
| Bott class (§1.2) | primitive 2∈𝔽₅× mod4; −1 over ℤ mod2; characteristic2 | Exact-order/image hypotheses retained; mod2 Bott can have order4, so unrestricted additivity rejected |
| Brauer character/lift (§§1.3–1.4) | trivial/p-groups; GL₂(𝔽₃) standard character norm2; cyclic degree2 extension | Virtual integral lift required; no GL₂→U(2) lift asserted; stabilization subtracts rank |
| Adams fibre and Quillen map (§§1.5–1.6) | q=1 excluded; q=2,3,4; determinant at q=5; prime-to-p embedding change | Connected H-space, not simply connected in general; uniqueness carries KU¹=0 hypothesis; continuous operations required at every ℓ ≠ p |
| Cohomology/detection (§1.7) | q=2 with ℓ=3,7 gives r=2,3; q=4,ℓ=3; GL₂(𝔽₂)=S₃ | Correct generator degrees/Bockstein; stable acyclicity only; separate ℓ=2 proof |
| Operations/res/transfer (§1.8) | 𝔽₂⊂𝔽₄ at K₃: res multiplier5, tr·res2, res·tr5; identity; K₀ | Positive-degree transfer onto only; no canonical cyclic generators |
| Closure and completion (§1.9) | characteristic prime; ℂ completed K₂ vs divisible integral K₂ | Derived Tate contribution retained; coefficient limit differs from ordinary completion |
| Finite/perfect characteristic2 hermitian (§1.10) | 𝔽₂ unit/hyperbolic form; 𝔽₄ K₁=ℤ/3; arbitrary perfect field; odd q | Symmetric bilinear vs quadratic distinction; integral full-spectrum even-field assertion separated from classical connective assertion |
| Symplectic/SL comparison (§1.11) | rank0 excluded; q=3,5,9; nonsquare2 at q=5 while −1 is square | H₂ odd order suffices, not vanishing; μ₂ generator distinct from square class; i=2 factorial unit |
| Henselian rigidity/localization (§§2.1–2.3) | I=0; unit ideal rejected; m=p rejected; field/DVR; n=0,1,2 | Jacobson/invertibility retained; DVR residue map is dévissage; degree1 valuation not erased |
| Boundary and parameter changes (§§2.2–2.4,3.2) | ∂{2,5}=2, reversed3 over 𝔽₅; diagonal−1; negative exponent−1; π→2π | Left-linear boundary, inverse tame Hilbert formula, and parameter-change direction fixed; six matching Lean examples proved |
| Integral vs coefficient sections (§§2.3–2.5) | 5→10 adds [2] mod4, integral even section unchanged; residue𝔽₂ | Canonical integral torsion section distinguished from coefficient section; four polynomial-base basis elements |
| Full norm-residue and primary exponents (§3.1) | d=1; wild/tame roots; μ₆ with p=2 | Projection uses p-primary inverse exponent; no naive primary equality |
| Kernel/section/Moore (§§3.3–3.5) | w=1; composite w; ℚ₂{−1,−1}; ℚ₃(ζ₃); equal characteristic | Choose a generating symbol value; section canonical only after torsion-free kernel; integer-ring wild torsion retained |
| Divisibility proof (§3.4) | ℓ≠p vs p; charp p-basis1 vs2 | Separate injectivity/surjectivity; independent Merkurjev and charp torsion inputs retained |
| Linear THH and log model (§§4.1,4.7–4.8) | zero category; field/DVR; THH(ℚₚ)/p=0 vs logTHH π₀=𝔽p | Linear weak-equivalence model retained; stable Perf localization cannot identify its residue term |
| TR/TC operators (§§4.2,4.4) | n=1,2; R[2]₂=2 vs F[2]₂=8 at p=3; 𝔽p/𝔽̄p | R/F separated; TR index shift fixed; negative TC group retained; bounded below checked |
| Connes/module splitting (§4.3) | trivial circle; d(x)=dx; dε=σ; p=2 | d²=ηd, not unconditionally zero; η≠0 is no nonzero-square witness; Hℤ/m-module hypothesis retained |
| Tate algebra/filtration (§4.5) | trivial group; C₃ on𝔽₃; C₅ onℤ; ut⁻¹→−1; d²ε=tσ | Algebraic comparison imports existing carrier; correct negative degrees/sign; conditional convergence only |
| Additivity/resolution/3×3 (§§4.6–4.7) | zero/cylinder categories; n=0 END; anticommuting suspended corner | Cylinder/saturation/extension/kernel closure/finite-generation hypotheses retained; chase uses sum with its sign |
| Coefficient presentation/Witt (§§5.2–5.3) | unramified e=1; ramified ζ; n=0,1,2; ℤ₃ Teichmüller additivity | θ=−1 gives Vπ=−V; quotient not coordinatewise; arbitrary-perfect coefficient theorem explicit |
| Log differentials (§5.4) | ℤₚ vs π^p=p; tame vs unramified; dlogπ residue1 | Annihilator ideal lies inside pA, equality precisely tame; log vs ordinary base change separated |
| Twisted derivation/hW (§5.5) | n=1; p=3 onℤ[x]; [x]²; length2 | Naive d(a₀) fails twisted Leibniz; actual Fd([x]²)=2x⁵dx; first summand retained |
| Log-Witt basis/products (§5.6) | n=1; r(i)=0; s=t; s or t0; exponent at e | Denominator argument nonzero; overlap/product/zero cases retained; final independence after Tate calculation |
| Log maps/ordinary THH/κ (§§5.7–5.9) | dlog1=0, boundaryπ1; ℤ₃ tame vs wild e divisible3; κ and −κ | Weak equivalence not integral automorphism; correct tame subquotient; κ Bockstein fixes sign; tensor overℤ before modp |
| Low TR and coordinate unit (§§5.10–5.11) | n≤3 first; μp absent; ℚ₃(ζ₃), u≡1−π, θ≡1+π, b=−πκ | Circular all-level proof split; μp/p−1 divisibility retained; other root fails dlog normalization |
| Tate permanents/differentials (§§5.12–5.13) | χ=0; p=3,e=2,x=α vs τα³; n=1; n=v_p(e); comparison degree0 | Infinite valuation handled; d² vs exterior d^(2p+1); endpoint representative and nonzero unit factors retained; NS strict bound i > −1 and finite-Moore variant specified |
| Bott/pro-comparison (§5.14) | e=p−1 carry; n=1,2; missing μ_(p^ν) | Exact exponent carry; pro vs levelwise distinguished; descent needed without roots |
| TC/local trace/descent (§§5.9,5.15) | ℚ₃ K₂/p=0; ℚ₃(ζ₃); TC₀ extraH²; tame/wild cyclotomic | Positive trace range; homotopy fixed points, not unproved invariants; perfect-infinite residue inputs explicit |
| Monoid and relative K (§§5.16–5.17) | e=1,p,p²; weight1; λ=0; dual numbers overℚ andℚ(t) | One orbit term survives e∤weight; e/p differential; correct big-Witt truncation and regularity/HKR hypotheses |
| Divisible subgroup/lattice (§6.1) | ℚ,ℤ,ℤ/6,ℚ×ℤ/6; ℤₚ/ℤ_(p); rank0 | Real supremum of divisible subgroups; no equality with fixed wℤ; divisible quotient need not split; matching Lean signatures |
| Completion exactness (§6.2) | bounded torsion; ℚₚ/ℤₚ Tate module; ℂ K₂ | ML/lim¹ conditions retained; tensor only with finite-generation hypotheses |
| w and cohomology (§§6.3–6.4) | i=0,1,2; p=2,3; ℚ₂ w₂=8, ℚ₃ w₆=9 | Invariant0 excluded; coefficient maps reversed under duality; odd rankd+1 at twist1 |
| Local finite/completed groups (§§6.5–6.7) | degree1 uniformizer; ℚ₂ K₃ torsion8; ℚ₃ K₁₁ torsion9 | Degree≥2 ring/field range; all-prime finite-local edge vs odd-p trace; ordinary Chern factorial not a universal isomorphism |
| Integral groups/comparison (§§6.8–6.9) | λ₁=0; i=2,ν=1 atℚ₂ has three mod2 factors; adjacent w₂ atℚ₃ | Divisible p-rank left undetermined; t_i+λ_(i−1)=d; kernels/cokernels and density not collapsed into an isomorphism |
| Cardinal/Milnor (§6.10) | r=0; inseparable finite extension; Ω²=0 in charp | Residue/transfer independent-family proof avoids false differential cardinality argument |
| Equal characteristic (§6.11) | 𝔽₂((t)),𝔽₃((t)); degree1 principal units; all p-prime indices | Vanishing completed high groups does not erase uncountable integral groups; principal units need full product |
| Homotopy and dyadic GW (§§6.12–6.13) | d=1; π₀; p=2 nonprocyclic; V=ℤ₂ | Full virtual-rank fibre; odd-prime splitting only; full-spectrum integral GW for V via L-completeness, no integral K-completeness claim |
| Arithmetic maps (§§7.1–7.5) | identity extension; split/inert/ramified places; {2,5}; {−1,−1} at2,3 | All local factors and transfer degrees retained; unramified étale image only for invertible coefficients; symbols/trace/edge maps named |
| Semilocal λ (§7.6) | ℚ; ℚ(i),p=5 with2+i valuations1,0; K₀ diagonal; −1 killed at5 | Actual embeddings/pure-tensor contract; final derived completion retained; local transfer sum verified |

## Source locator audit and durable resumption points

Public sources read include K-book/Handbook, Haine/Mestel, Atiyah–Segal, CMM, HM97a/HM97b/HM03/HM04, Hesselholt96/05, GH06, NS, Sharifi, Calmès II/III, AV and WeibelChern. In addition to high-risk formulas, a locator sample was checked across more than fifteen distinct results: K-book IV.2.5.1, IV.1.12–13, VI.2.2–3, VI.7.3–5; Haine5.7–5.8; Mestel30/35; CMM1.4/4.29/4.36; HM03 Lemma3.3.10, Theorem2.4.3, Lemma5.5.3 and Theorem6.1.10; HM97a2.3 and3.1; HM97bA/B/4.2.10; Hesselholt05 Theorems11/13; GH06 Theorem3.1; NS II.4.9 and IV.4.8–10; Calmès III3.1.3–10; AV2.7.1–2; WeibelChern5.1; Sharifi9.3.2/8. The README records the exact versions and printed-versus-PDF numbering.

Corrections made while packaging include HM97a Witt π₀ Theorem2.3 p.18 (PDF22), the NS classical comparison pp.263–265 and the CorollaryIV.4.8/PropositionIV.4.9/CorollaryIV.4.10 numbering pp.360–361, HM97b printed pp.74–75/95 rather than unmarked PDF offsets, the exact GH06/WeibelChern article titles, and HM03 Theorem2.4.3 p.44 rather than “Corollary”. The early Chern map is an edge operation when an isomorphism is required; the ordinary Chern class's factorial is explicitly retained. The source errata correct integer-ring K₂ wild torsion. No new erratum was asserted merely because an exposition was abbreviated.

The independent reviewer should start with (1) early Chern supplier registration/order and the unregistered Poincaré contract, (2) the Bockstein/étale filtration alignment of §6.8, (3) the explicit Tate page and ramified-unit formulas, (4) the §5.15 perfect-infinite-residue extension and source boundaries above. This is a source-proof and dependency audit, not a request for another worker to finish unwritten package sections. The roadmap and all deliverables are complete. Scratch downloads and working logs are disposable after the PR opens; no next worker depends on them.
