# FIX-PKG-PadicHodgeTheory~adv

Codex, session `codex-dxdnjG`, issue #10108, 2026-10-17. Input atlas commit: `09b90e43ebc20d5e8d1a6da39966a0c9aeac1e87`. The bot confirmed claim comment 6233874935. This submission changes only the four issue deliverables.

**Disposition: needs_changes.** The local repair and adversarial pass are finished. The package now gives concrete constructions for the local gaps and exact contracts for the additional lower mathematics. Acceptance remains blocked by the coordinated lower-owner edits listed below, outside this issue's permitted paths. An import in this package does not certify that those edits have happened. No second job was claimed, and no other roadmap was edited.

## Finding-by-finding disposition

The finding numbers refer to [the independent review](../reviews/REV-PKG-PadicHodgeTheory~adv.md). Corrections that review had already applied are preserved.

| Finding | Change in this submission | Disposition |
|---|---|---|
| 1: duplicated C/action, actual de Rham carriers, DVR/topology/t/gr | §§0.1–0.3 import Selmer §§4.1–4.4 on the existing Mathlib carriers. Removed `thetaDR`, the geometric-instance/DVR declarations and their owned examples from Suggested.lean. Relative affinoid structures, coordinate dictionaries and logarithms retain their additional scope. | Local duplication removed; lower prerequisite rewire remains. |
| 1: duplicated A_cris/B_cris, embedding and fundamental sequences | §0.4 imports Selmer §§4.2–4.3. New regular-pair affinoid presentation and stronger integral divided-Frobenius APIs remain. The supplier's 1−φ becomes φ−1 by negating its target and boundary. | Local ownership corrected. |
| 1: Tate–Sen cycle | Explicit order: Selmer §4.1 C/action → finite-flat §R07.1.18 Tate–Sen → Selmer §4.4 fixed fields. No PadicHodgeTheory result enters this chain. | Blocked on the external rewire, not certified closed. |
| 1: period functors/predicates and inverse realization | §§3.1,3.3,3.5 import Selmer and Néron functors/predicates, finite-flat §R07.3.3 full faithfulness, `vSt`, `dStar` and dimension test. New D_HT, abstract regular-period theorem, covariance and Galois-descent adapters are distinguished. | Local duplicates removed. |
| 1: filtered φ,N carriers, slopes and weak admissibility | §§3.2–3.4 import finite-flat §§R07.2.15,3.1–3.3, including nilpotence, slopes, numbers, abelian weakly admissible category and completed-unramified invariance. Only the additional quotient/strictness/weight/HN APIs remain. | Corrected. HN proof specifies the finite slope set and rank induction. |
| 1: Fontaine–Laffaille | §§6.1–6.2 import finite-flat §§R07.3.15–3.17 and the narrower Selmer §§4.6–4.7 theorem. New work is the covariance/weight-shift dictionary. | Corrected; rational width <p and integral safe width ≤p−2 remain distinct. |
| 1: Néron B_st/WD/abelian comparison | §§0.5,3.3,5.3,8.3,9.3 use the lower constructions. Keep absolute-monodromy, algebraic-versus-completed constants, covariance and comparison-agreement adapters. The WD recipe itself is no longer planned twice. | Corrected locally; retain supplier normalization checks below. |
| Additional ownership overlap found during this fix | Finite-flat §R07.4.13 already owns Colmez–Fontaine over the arbitrary-perfect-residue Kummer frame of §R07.4.1. §§3.5,5.2,5.5 now import it, with the contravariant Hom/covariant dual adapter and an effective twist. Removed the duplicate analytic CF prerequisite family; all three associated Checks survive as source/convention tests. | Corrected; §5.5's new endpoint is the group-valued period torsor. |
| 2: classical B-pair derived comparison | §4.5 constructs an actual roof through the zero-differential cohomology complex using algebraic Q_p-linear cycle representatives. Splitting boundaries gives the contracting homotopy, hence independence and naturality in D(Q_p). Yoneda cups and weak effacement give cohomological cup compatibility; field Künneth gives the derived product square. | Local construction supplied. No topological/equivariant splitting or strict multiplicative/E∞ map is promised. |
| 2: relative all-module comparison | §7.6 constructs Q_φ and Q_B from the same positive-twist Koszul resolution E→[E(n)²→E(2n)]. Fixed-section inclusions, diagonal patch restrictions and augmentations give actual chain maps and the common roof. Supplies common radii, common tensor refinements, descent, cups, twists and triangles. | Local construction supplied; KL 9.4.5 is used only for local systems. |
| 3, §0.4: separated ξ/p-series ring | Establishes p-closedness and T-closedness of (pT−ξ) in A[[T]], regularity, p-saturation of T powers, separation after inverting p and injection by finite T-quotients. Raw coefficients are explicitly not unique. | Proof route supplied without using the desired embedding as its premise. |
| 3, §§0.4,2.5: PD coefficient presentation and injection | Gives iterated p-divided-power variables, relations, regular-pair elimination and the finite-support mod-p basis. Defines the closed PD filtration, identifies its de Rham inverse image, and proves separation by weights modulo p and p-saturation. Structural injection is coefficientwise in restricted PD variables, in the smooth formal setting. | Supplied; Brinon's public Numdam memoir was checked directly, including the rendered relation on printed p.62. |
| 3, §0.6: P_l | Gives θ_l, its PD envelope H_l, P_l=H_l⟨X_l⟩, z and W_l coefficient maps, Frobenius/truncation transition, root change, null-coefficient completion and operators. | Explicit construction supplied from Breuil §2 and Kato §3. |
| Additional normalization error caught in the fix pass | Breuil/Kato use N_π(log(1+X))=+1. Our completed-ring operator is **−N_π/e**, not +N_π/e. Hence N(X)=−(1+X)/e, N(z)=z/e and N(log[p♭])=−1. Both tensor factors scale by c=−e in the edge theorem; δ_(cN)=c⁻¹δ_N. | Corrected in README and proved scalar/derivative Lean examples. This Breuil sign is separate from the oriented Néron WD scalar adapter. |
| 3, §2.6: relative logarithmic independence | Cut the unsupported relative injectivity claim. The polynomial period sheaf has a canonical substitution map and its preimage filtration; neither its horizontal polynomial calculation nor §8.1's constant B_st comparison requires this map to be injective. | Stronger unused interface removed; field transcendence is used only at the constant field. |
| 3, §2.7: singular proper primitive comparison | Adds the restricted SNC j_! boundary resolution, its stalk contraction, closed-immersion formula, proper resolution isomorphic over the smooth open and induction on the closed complement. Computes the degree bound on each stratum. | Missing compact-support input is now explicitly used, with Scholze survey 3.14–3.17 locators. General compact support remains downstream. |
| 3, §6.4: CDT lifting adapter | Names and states lower `tameConnectedEtaleRankOne`, including actual group/lattice, field e=p−1, coefficient action, determinant and fixed residual vector. Gives connected–étale/Cartier-dual proof and transports canonical descent. | Exact lower extension supplied as a request, not asserted already present. |
| Additional false generalization found in §6.4 | At p=5, (χ₅ω̃⁻¹)⊕ω̃ has determinant χ₅, becomes χ₅⊕1 over Q₅(μ₅), and has residual unramified quotient, but neither characteristic-zero quotient is unramified. | Replaced the unqualified downstairs conclusion by potential ordinarity, adding reduction compatibility with the specified residual quotient for downstairs ordinarity. Nonsplit unique-quotient data satisfies it. |
| 3, §9.3: all-p twist/reduction | Specifies `potentiallyMultiplicativeTwistReduction` as an EllipticCurves Layer 5 extension. Uses existing Tate/twist objects, minimal reduction and Néron §1.10 unramified base change. Ramified η is additive because unramified η is exactly multiplicative and v(j)<0 excludes good reduction. | Proof and exact lower extension supplied, including p=2; registration remains external. |
| Other supplier qualification: F′_L | §5.1 retains the actual constants and the necessary enlargement before identifying them with L₀. Current RD.2.33/2.35 already state general constants K′, so no universal K′=L₀ claim is imported. | Preserved and cross-checked. |
| Other supplier qualification: Dieudonné σ-pullback | §8.3 keeps the contravariance and σ-pullback until a semilinear adapter is provided; rational inverse-dual comparison is distinguished from an integral identification. CR.7.2 has F:σ*D→D and V:D→σ*D. | Preserved; no unchecked integral identification added. |
| Other supplier qualification: H¹/Kottwitz | §5.5 names the additional pointed bijection `localTorsorKottwitz` for connected reductive G/Q_p, its functoriality and neutral-class test. The existing point homomorphism is explicitly insufficient. | Exact ReductiveGroupsPartII extension requested; registration remains external. |

## Required lower-owner coordination / upstreamNotes

These are the remaining reasons for `needs_changes`. A worker restricted to this issue's four paths cannot apply them. The maintainer should route the changes to the owning package jobs; no new source, errata or second worker job was opened here.

1. **Selmer §4.4 and finite-flat §R07.1.18.** Replace the unsupplied LocalFieldsRamification Layer 1 Tate–Sen dependency in Selmer §4.4 by finite-flat §R07.1.18. Keep finite-flat's C/action prerequisite strictly at Selmer §4.1, independently of Selmer §4.4/4.5 and PadicHodgeTheory. Order these prefixes together. LocalFieldsRamification still supplies the local-field and ramification material it actually has.
2. **Finite-flat §R07.3, adjacent to its connected–étale/height-one exports.** Register `tameConnectedEtaleRankOne` exactly as in §6.4: F₀ unramified, L=F₀(μ_p), actual rank-two O'-Tate lattice with determinant χ_p on I_L and a nonzero fixed residual vector. Export the rank-one connected/étale pieces, inertia, coefficient duality, canonical descent and residual-quotient map. The order-p classification at e=p−1 and the all-p height-one theorem are its lower inputs. Do not register residual ordinarity alone as sufficient for downstairs ordinarity: the displayed split example disproves that statement. The p=2 case uses e=1 and the all-p finite-flat input, not an odd-p FL argument.
3. **EllipticCurves Layer 5 extension.** Register only `potentiallyMultiplicativeTwistReduction` on the existing Tate q, twist character and minimal-reduction predicates. Proof inputs are the existing multiplicative splitting theorem, uniqueness of the ±1 twist for j≠0,1728, good⇒integral j, reduction trichotomy and Néron §1.10 étale base change. Include ramified Q₂(i) and unramified quadratic Checks. A second Tate-curve or twist construction is unnecessary.
4. **ReductiveGroupsPartII, beyond RG2.1.5.** Register `localTorsorKottwitz`: canonical pointed H¹(Q_p,G)≅(π₁(G)_Γ)_tors for connected reductive G, functorial and neutral iff zero. Its proof must supply the local torsor theorem (torus quotient and simply connected derived group), rather than infer it from `KottwitzMap.kottwitz`. §5.5's period-torsor class comparison remains here.

Transport checks to retain during that coordination:

- **Néron §5.3:** its oriented uniformizer monodromy N_K=e_K N_absolute, restriction scalar e_(K′)/e_K and `iso_smul_monodromy` must be preserved. Explicitly pin the logarithm orientation when comparing presentations. The test Ny=5x becomes Ny=(5/2)x at e_K=2; the Weil action is unchanged. Breuil's positive-log operator instead equals **−e_K N_absolute**, with the edge-map scalar specified above. These operators must not be conflated just because both use a uniformizer.
- **AInfCohomology scope/supplier list:** redirect the moved finite-field C/Tate–Sen/B_dR/A_cris/B_st/period-functor subjects to the Selmer/finite-flat/Néron prefixes, or label PadicHodgeTheory's appearances as reexports. Keep early AI.0/AI.1 independent of the primitive theorem and rational comparisons. AI's BKF modifications may use §7.5 after that early sheaf input; no new package-level cycle follows from the bundled prefix order.
- **PrismaticCohomology / PerfectoidQuotients:** retain their integral comparison and bounded-torsion/derived-completion inputs. The new relative roof uses locally split finite-projective sequences, not a general flatness claim about completion. No integral theorem is deduced from the rational roof.
- **RD.2.33/2.35 and CR.7.2:** retain the actual constants and σ-linearization conventions described above. The current statements already expose these distinctions; they are not requests to weaken those statements.

## Adversarial pass on the changed statements

Each row covers the assertions and API identities in the indicated family, with its attached Checks. These are mathematical computations and proof-route checks; they do not claim that the heavy targets have been formalized. Cases outside a stated hypothesis are negative controls, not silent extensions. Existing Checks were preserved; the three duplicate-CF Checks were rewritten as imported/source convention tests.

| Statement family | Instances / calculation | Result and change |
|---|---|---|
| Ownership and bases | Finite K, arbitrary perfect k, e=2, zero objects; compare exact lower sections | Duplicates imported; finite-field results do not imply a general geometric comparison. |
| §0.1 action and descent | Identity, finite L/F with standard action, zero; every vector discrete versus a completed vector | Fixed space F; open-stabilizer condition retained. C's action is continuous, not discrete. |
| §0.1 normalized traces/cohomology | R_n(1)=1; next-level root has trace zero but its p-th power is fixed, also p=2; r=0,1 | Trace is linear, not multiplicative; H¹(C) is not zero; ownership ordered below. |
| §0.2 theta and de Rham structures | θ([p♭])=p, θξ=0; ε first coordinate at p=2; C point | Actual carriers retained. Nonidentity ε uses valuation, not first coordinate. |
| §0.2 DVR negative controls | ξ valuation 1; X²−ξ; ξ modulo ξ² | B_dR is not algebraically closed; gr rank one does not imply an equivariant section. |
| §0.3 topology and t | pⁿ→0 in coefficients, g(t)=−t when χ=−1, t mod t² | Retain natural coefficient topology and positive graded Tate sign. |
| §0.3 Laurent B_HT | Degree zero, t, 1+t; trivial representation | Multiplication adds degrees; 1+t is not a Laurent unit; B_HT regularity is proved through the abstract target, not misattributed to Selmer. |
| §0.4 PD presentation | p=2: δ₀²=2δ₁, δ₀²=0 mod2 but δ₀≠0; unit class | Ordinary polynomial and A[ξ/p] substitutes fail; regular-pair finite-stage elimination retained. |
| §0.4 filtration and injection | n=0,1,2; leading ξ^[n−1]a; mod-p finite basis and p-saturation | Preimage Filⁿ=J^[n]; weight separation avoids assuming injection. |
| §0.4 series quotient | ξ−pT=0; mod p and T; quotient T^m; unit | Raw coefficient uniqueness is false. Closed ideal and p-saturated powers give the required separated quotient. |
| §0.4 I^[r], Frobenius, localizations | r=0,1, p=2; μ+p; θφξ=p^p−p; 1/p and t | Membership remains necessary; φ not filtered; integral subrings remain incomparable. |
| §0.4 sequences and signs | φ−1 versus 1−φ at φ=2; r=0 quotient; diagonal pair | Negate target and connecting map. Extra divided-Frobenius sequences retain their stated range. |
| §0.5 maximal ring/logarithms | Ramified coefficient field without Frobenius lift; q=p; first two log terms | Ramified Frobenius has a σ-base-changed target; no arbitrary coefficient endomorphism. |
| §0.5 imported B_st | N(u)=−1, N(u²)=−2u; e=2 uniformizer; unit branch | Constant B_st imported; absolute operator and branch adapter retain their explicit signs. |
| §0.6 finite P_l | l=1; inverse Frobenius^l coefficients; root change twice | θ_l exponents are l−i; transition needs Frobenius and truncation; root-change inverse has the stated direction. |
| §0.6 completion | PD X^p=0 modp but X^[p] survives; coefficients all 1 | Restricted null-coefficient completion required; arbitrary formal series rejected. |
| §0.6 monodromy | p=2: N_πφX=2(1+X)²; e=2; logarithm coefficient (n−1)! | N_absolute=−N_π/e; correcting only scale fails the log sign. Base z has the opposite sign to X. |
| §0.6 edge | D=0; N_D=0; c=−2; φ=p^r restriction | δ_(cN)=c⁻¹δ_N; absolute edge is c times source edge. No unrestricted edge factorization is inferred. |
| §2.5 horizontal crystalline coefficients | Dimension 0, p=2, ξ^p/p; arbitrary perfectoid versus smooth formal model | Direct basis/injection precedes almost acyclicity. Structural strictness is scoped to the formal hypotheses. |
| §2.5 structural variables | One variable, zero variables, change T^p to T^p+pT | Coefficientwise restricted-PD uniqueness uses the horizontal injection. Structural Frobenius remains lift-dependent and not filtered. |
| §2.6 polynomial semistable map | u⁰,u,u²; v_p(π)=1/2; derivative kernel | N=−d/du, kernel constants in characteristic zero; no relative transcendence claimed. Corrected scalar extension K₀→K, rather than the residue field k. |
| §2.7 SNC boundary | D empty; one point on P¹; two crossing branches | Identity for empty boundary; H_c⁰(A¹)=0; (a,a)↦a−a=0 and augmented simplex exact. |
| §2.7 singular proper descent | Resolution iso over U; boundary fibres; nodal curve d=1 | Proper j_! pushforward is zero off U; localization bound stays 2, not 3. Nonreduced structure handled by coefficient/étale invariance. |
| §2.7 degree and integral limits | Stratum codimension a: 2(d−a)+a≤2d; torsion complex; k=0 | Integral perfectness permits torsion; k needs k+2 nested levels; no arbitrary-submodule freeness inference. |
| §3.1 abstract regularity | Trivial group; B a field, F[X], F(X), B_dR⁺; zero/unit V | Fixed-field and stable-line-unit conditions are essential. t rejects B_dR⁺; finite-K dimensions remain lower results. |
| §3.2 extra filtered API | Zero; one jump r; bijective identity 0→1; dual/tensor lines | Hodge inequality direction is ≤; equality iff strict. Average weight excludes rank zero. |
| §3.3 functors/covariance | Unit, Q_p(1), ramified K; Hom realization | Covariant jump −1 and φ=p⁻¹; contravariant jump +1 and φ=p; imported inverse and dual adapter agree. |
| §3.4 slopes/WA/HN | Rank zero/one; φ=diag(1,p), Nf=e; Fil¹=e versus e+f; jumps −1,2 | N lowers slopes; tensor sum and negative dual transpose retained. Equality of total numbers alone insufficient. Finite possibilities justify extremal HN step. |
| §3.5 descent | Trivial and quadratic descent on same unit module; ramified versus unramified extension | Full faithfulness lifts cocycle, not trivial descent. Ramified extension does not detect crystallinity downstairs. |
| §4.4 retained Wach import | p=2, d=0 cyclotomic frame, dual weights | Existing p>2 supplier only; no new p=2 bridge introduced. |
| §4.5 classical roof | Zero; unit; slope-one nonétale object; boundary contraction | Over Q_p, zero-cohomology maps are null-homotopic. This fact is not used for a sheaf category. |
| §4.5 products and differential | φ=2,γ=3: d⁰1=(1,2), d¹(1,0)=2; swap gives −2; degree-one cup swap | Keep degree-two −1 adapter and Koszul sign. Yoneda/dimension shift yields cups, not a strict multiplicative representative. |
| §5.2 realization agreement | Unit, φ=p/jump0; slopes −1,+1; change positive lattice | Total degree zero not étaleness. New theorem compares Robba and imported CF realizations, not a duplicate CF proof. |
| §5.3 WD constants/normalization | e=2 and v_K(q)=5; f_K=2; rank zero/unit/twist | Absolute N coefficient 5/2, arithmetic exponent −f_K; algebraic constants compare after scalar extension, not by carrier equality. |
| §5.5 general-base CF | k finite and algebraically closed; jump m/φ=p^m; effective shift | Imported all-perfect-k equivalence, dualizing lower Hom realization and undoing twist. Adjacent/source Checks retained without new analytic interfaces. |
| §5.5 torsor | Trivial group, G_m m−h, GL_n, unstable two-line module | Only weakly admissible data yields the period torsor. Full pointed H¹ identification is a separate lower contract; neutral class is zero. |
| §§6.1–6.2 FL dictionaries | p=2; endpoints 0,p−1; zero, unit and Tate line | Rational and safe integral windows remain distinct; U and covariant V are dual, with opposite weights. |
| §6.4 connected–étale adapter | p=2,e=1; p=5,e=4; ramified O'; dual inverse different | Actual lattice, determinant and fixed vector are required; coefficient torsion embedding is not an integral equality of dual lattices. |
| §6.4 residual quotient | (χ₅ω̃⁻¹)⊕ω̃; tame value 2, inverse3 mod5; wild value6≠1 | Counterexample disproves unqualified ordinarity; compatibility of the descended quotient fixes it. |
| §7.6 Frobenius domains | d>0, q≥2; 0<s≤r/q; φ=2; rank zero | Both maps land on [s,r/q]; no same-annulus endomorphism asserted. q=1 is excluded by d>0. |
| §7.6 patching | Zero; diagonal section; unit Cartier equation; nonprincipal global Cartier ideal | Local row exact; no global principal equation or general flatness of completion assumed. Affine patch components split exact bundle sequences. |
| §7.6 positive resolution | n=0 maps (1,1),(-1,1); slope-one line; n large | Composite zero for n=0 but acyclicity needs large n. Resolution applies beyond local systems. |
| §7.6 products/naturality/descent | Two choices and their tensor; three choices; total bidegree (1,1) | Augmentations give common refinements and coherent derived roofs. Mixed terms cancel with total sign; omission gives 2 over Q. |
| §8.3 covariance | g=0,1; ordinary/supersingular; σ pullback; polarization divisible by p | Lower abelian comparison imported; rational inverse-dual agreement does not erase integral σ pullback or assert integral perfectness. |
| §9.3 reduction | Zero-dimensional abelian; Tate curve; good supersingular; isolated finite model | Actual compatible p-power lattice models required; Raynaud calculation is an agreement check of lower semistability. |
| §9.3 all-p twisting | η=1, nontrivial unramified, ramified Q₂(i); v(j)<0 | Unramified descent preserves multiplicative reduction. Ramified quadratic gives additive potentially multiplicative; no short integral p=2 twist formula. |

## Suggested.lean variable/signature pass

Read every declaration and its enclosing block. `AnalyticCoefficients` initially assumes `[NormedField K]`; only convolution theorems acquire `[CompleteSpace K] [IsUltrametricDist K]`. Matrix hypotheses are local to each declaration. No omitted global variable supplies a geometric hypothesis.

| Declarations | Instances / hypothesis check | Result |
|---|---|---|
| `laurentConvergesOn` and three examples | Empty I; singleton 1; finite support; geometric support at ρ<1 and ρ=1 | Empty I is vacuous but cannot instantiate a norm theorem requiring ρ∈I. Finite support converges even without positive-radius assumptions. |
| `gaussNorm`, coefficient bound, zero iff | Zero family, monomial, positive radius; unbounded family outside convergence | Conditional supremum not used without boundedness supplied by convergence; hρ and hρI remain explicit. |
| Radius-one adapter | General normed field, cofinite decay | Same existing restricted-series membership; no second ring carrier. |
| `gaussNorm` three examples | 1+T, constant c, T−c evaluated at c | Norm=max(1,ρ), norm c; point evaluation zero does not force Gauss norm zero. |
| Convolution two theorems | Finite support, zero, ties; complete nonarchimedean field | Uses genuine imported discrete convolution; radius hypotheses present. |
| `kummerMatrix` and API/examples | Any commutative ring, including characteristic2/zero ring; (2,3)(5,7)=(10,17) | Character multiplies second cocycle, determinant a; coboundary sign + (a−1)b. |
| `tateLInvariant` and three examples | General field; v≠0 in ratio/branch/classification, c≠0 for scaling; v=2,ell=4,b=3 | Ratio2, shifted5. Definition at v=0 is total field division but is excluded from classification. |
| `tateNormalForm_iso` | Nonzero v,v′, coefficient characteristic2 allowed | Exactly the stated scalar equations classify the ratio; no assertion about arbitrary filtered modules. |
| `tatePhiMatrix` and three examples | General field; r=0 definition versus r≠0 relation; r=2,3 | Reciprocal determinant; inverse arithmetic operator. Degenerate r=0 not used as Frobenius. |
| `tateMonodromyMatrix` and five examples | Any commutative ring for definition; zero v; nonzero nilpotent over Q; transposed N | N²=0 not N=0; nonzero field r in relation; arithmetic relation direction correct. |
| `tateFiltrationVector` and three examples | Arbitrary commutative ring, ell=0, ell=±2 over Q | Second coordinate1; opposite first coordinates distinct only in the characteristic-zero witness. |
| New coefficient/PD examples | Generic ring hom with f(x)=0 and p≠0 in target; rational p=2 coefficients; CharP2 PD ideal | Real assumptions, not arbitrary data named theta/PD. Existing divided-powers factorial identity proves x²=0; ordinary polynomial X²≠0 is a negative control. |
| Breuil and boundary examples | Positive integral derivative at p=2, negative half derivative at e=2; c=−2 | Pin both signs and ramification scale; transport of c⁻¹b multiplies back to b. |
| All other retained examples | Polynomial log derivatives; toric +translation; minus connection boundary; dual index 1−i; Artin inversion; Herr swap; total sign; reciprocal Frobenius | Computations agree with README. Scalar examples are explicitly convention witnesses, not constructions of period representations or cohomology. |

The file contains **7 real-bodied light definitions, 13 theorem signatures and 58 examples, 434 lines**. Each surviving definition still has at least three discriminating examples. No Checks were trimmed. Removed the closing catalogue/process comment; heavy targets are specified in the README.

## Source and library evidence

The public sources below were read on 2026-10-17 at the stated locators. These are original mathematical descriptions and proof routes, not copied passages or sequential source summaries. No restricted book was used or copied. Brinon's memoir is freely served by Numdam; the needed displayed relation was also inspected as a rendered page because its extracted font text is poor.

| Public source / version | Locators used | SHA-256 of PDF read |
|---|---|---|
| [Kedlaya–Liu, arXiv v5](https://arxiv.org/pdf/1301.0792v5) | 1.3.6 pp.16–17; 6.3.10–.12 pp.140–142; 6.3.19 pp.143–144; 8.7.6–.14 pp.178–180; 8.9.3–.6 pp.187–188; 9.3.12–9.4.5 pp.197–200 | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| [Nakamura, journal version](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms200401.pdf) | Appendix 5.9–5.11 and cups, printed pp.563–566 | `fbe7c28975b83867433bf480b356d8fcb18e88e473910bd44162039ca3242f98` |
| [Brinon, Mém. SMF 112](https://numdam.org/item/10.24033/msmf.424.pdf) | Proposition 6.1.1, Corollary 6.1.2, Proposition 6.1.3 pp.62–64; Proposition 6.2.1/proof pp.69–70 | `1da7bcabf91f23c529c24a9b5726e73275b7cce224194d1a94d4a11a0cb689e9` |
| [Breuil, author version](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/Griffiths.pdf) | §2 pp.3–6; §4.1 pp.7–9 | `1adbc19b4d93ae157e4d297e41fa4ac6e225bcde6c589cebf09271fe6d60f3f3` |
| [Kato, Astérisque Exposé VI](https://www.numdam.org/item/AST_1994__223__269_0.pdf) | §2.2 pp.272–273; §§3.2–3.9 pp.277–280 | `869fa59678eeb1f622e6c9f62e3ef1239581a2acbe38615cd3bb3ff0894b687f` |
| [Tan–Tong, arXiv v2](https://arxiv.org/pdf/1510.05543v2) | 2.2–2.3 pp.5–6; 2.6–2.8 pp.7–11; 2.23 pp.19–22 | `1de1a71b63784868c3028087398a15f9f478194c554b2437c809079b2a6da7cb` |
| [Fontaine–Ouyang](https://www.imo.universite-paris-saclay.fr/~fontaine/galoisrep.pdf) | Exercise 6.3; Lemma 6.12 pp.119–121; Definition 6.15 p.122; general-base theorem pp.140–143 | `56590ae4bc10cc274491a37c1ab65af2eb1f712227bc295fe986d66c3204059f` |
| [Disegni–Liu](https://arxiv.org/pdf/2204.09239) | Appendix B.5, B.13–B.15 pp.91–92 | `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa` |
| [Scholze survey](https://arxiv.org/pdf/1303.5948) | 3.14–3.17 pp.17–20 | `c18d6f9ff5da4a7939b85d9355230acf05a74813950eb07b06035f5787fd271d` |
| [Conrad–Diamond–Taylor](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf) | Lemma 2.1.2 and proof, author-version pp.8–9 | `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c` |
| [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Definition 3.4, Lemma 3.5 pp.22–23, with the quotient qualification explained above | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |

Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current main audit: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Read the current LocalGaloisGroups and ProfiniteArithmetic README/signature files as models and the relevant current AdicSpaces, AlgebraicVectorBundles, EllipticCurves and Néron interfaces. Object searches included all nine roadmaps newer than the snapshot and current library period/curve/Kummer/series declarations. No new independent theory is justified by changing a name.

Read the pinned FontaineTheta, BDeRham, WittVector.Isocrystal, divided-powers factorial identity and restricted two-sided-series statements. The existing carriers and operations are used directly; the new CharP2 example invokes `DividedPowers.factorial_mul_dpow_eq_pow`. Reviewed library coverage has no dedicated PadicHodgeTheory entry that would independently certify these period comparisons.

## Validation and resumption

- `lean-check research/blueprint/packages/PadicHodgeTheory/Suggested.lean`: **exit 0**, pinned build, **41 warnings, all declaration uses sorry**, no errors or other warnings. Latest run includes the corrected Breuil sign and edge-scalar example. No build/update/cache or Lean language server was started.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/PadicHodgeTheory/Suggested.lean`: pass.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: pass.
- `git diff --check`: pass.

To resume after lower coordination: inspect the four required lower changes above, update only the supplier imports affected, preserve the completed constructions and negative controls, then rerun the independent adversarial review and validation. In particular, do not restore the duplicate CF proof or the false split residual-ordinary implication. Sources and exact locators/hashes needed to repeat this pass are recorded here; scratch files are disposable. No formalization of the heavy mathematics is claimed.
