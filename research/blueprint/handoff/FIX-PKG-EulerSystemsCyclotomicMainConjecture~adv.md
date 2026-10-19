# Fix: Euler systems and the unconditional cyclotomic main conjecture

Refs #10989. Codex (GPT-6), session `codex-lf8pwI`, 19 October 2026.
This is a completed package fix, not a checkpoint. The findings are in
`research/blueprint/reviews/REV-PKG-EulerSystemsCyclotomicMainConjecture.md`;
there is no separate report with the `~adv` suffix.

## Finding dispositions

1. **Uniform circular-unit descent, §3.3 — resolved.** The natural map
   from the coinvariants of the actual global-unit/circular-unit norm
   quotient now has a named target, `circularUnit_descent_bounded`, with
   separately bounded finite kernel and cokernel. Belliard Theorem 1.1(2),
   Lemmas 4.1–4.2, Proposition 4.3 and Lemmas 5.1–5.2 supply the independent
   proof. The outline retains the torsion in the stabilized circular-unit
   cokernel and the fixed decomposition-field norm lattices.
   `primitiveCircularLimit_eq` identifies the primitive-character generator
   convention with that norm limit, using distribution and vanishing of
   the fixed-conductor norm system. It asserts no finite-level lattice
   equality. `sinnottCorrection_bounded` is now checked directly against
   Sinnott's introduction theorem, p.182, Theorem 6.1 and §7: the complete
   real-field correction is a fixed rational number times a power of 2
   at large levels. At odd p its valuation is therefore bounded. Only μ
   and λ are compared by growth; §3.4 still uses divisibility to identify
   characteristic ideals. No main conjecture is used in this descent proof.
2. **Odd-prime split lattices, §4.21 — resolved.** The replacement gives
   the p-unit lattices W_i and V_i, prime-divisor modules I_i, valuation
   μ_i, logarithm λ_i, discrete class limits, split-prime quotients and
   finite control defects. Named targets are
   `oddSplit_lattice_exact_sequences`, `oddSplit_control_defect`,
   `oddSplit_successive_indices` and `faithfulCharacter_quotient_length`.
   The two displayed exact lattice sequences retain their finite ends.
   Mazur–Wiles Proposition 3 and the cyclic local/global norm diagram
   identify the defect with pI_i/λ_iW_i. Both first lattice quotients
   identify with W_i/V_i. These isomorphisms justify the cancellation.
   Solomon Lemmas III.3–III.5 then compute the successive log and valuation
   cokernels, and the norm kernel/cokernel comparison handles the faithful
   integral character quotient. The lower lattice is W_(s−1), not
   V_(s−1); the split-prime characteristic factor over O′ is T^(p^i),
   not T. The s=0 calculation has its own Mazur–Wiles base.
   The nonsplit case also records its exact Euler-factor error.
3. **Exceptional Gauss-vector nonvanishing, §4.18 — resolved.**
   `gaussIdealProjection_ne_zero` constructs the actual algebraic
   character projection and detects it by the Stickelberger valuation
   B₁. `minusTwoUnit_log_rational_injective` proves rational injectivity
   at a completely split completion using the logarithm kernel and the
   minus condition. Normalizing representatives to local units permits
   the precise generic Baker–Brumer input; `gaussLogProjection_ne_zero`
   then proves that this particular algebraic vector has nonzero log.
   Its inverse-index character sum is matched to λ before applying (G2).
   This removes the use of the unresolved supplier nonvanishing target
   as an assumption. No Gross conjecture or unverified Gross §4 locator
   is used. At odd p the lattice argument uses this deduction character
   by character over a splitting field, not a claim that rational
   independence implies independence over all p-adic coefficients.
4. **Conductor-one Coleman comparison, §§4.7–4.8 — resolved.**
   The Δ-trivial rational component is reduced to F=ℚ. The actual
   smoothing unit has series h_a(X)=(1−(1−X)^a)/X, with unit constant
   term a. `pureCyclotomic_coleman_transport` specifies C:Z↦−X,
   the weighted derivatives, arithmetic Frobenius and
   αψ=−ΘCol₀=ΘCol. `pureCyclotomic_smoothed_stickelberger` derives the
   image from the independently normalized finite Stickelberger sums.
   The operator a[a]−1 is a unit on the required nontrivial Φ-factor.
   Γ-inversion T′=(1+T)⁻¹−1 and the Tate twist are tracked separately.
   The p=5, ρ=ω², a=2 computation has boundary coefficient −1 and
   normalized second moment +1. The old nontrivial-Δ lemma is used
   only when its hypothesis holds. Section 4.8 consumes this comparison.

The pass also corrected two source-level wording problems rather than
propagating them. In §4.7 the required congruence is f(0)≡1 mod p,
not f≡1 coefficientwise (Greither's definition, p.458). In §4.21 the
compact dual has no nonzero finite **submodule**, the property used in
the Euler characteristic; the word “quotients” in Solomon's p.488
sentence cannot hold for a nonzero finitely generated module over the
local Iwasawa ring. Proposition II.3, p.479, and the dual of the discrete
class limit give the needed submodule property. These observations are
recorded here for the maintainer; no source or errata job was claimed.

## Ownership and retained inputs

The four arithmetic comparisons are local targets of this application.
Generic circular units and index theory, arithmetic control, abelian
Leopoldt and Baker–Brumer remain with IntegralIwasawaTheory; Coleman
interpolation and the signed actual-generator theorem remain with
ColemanPowerSeries; independently normalized analytic series,
Gross–Koblitz and Ferrero–Greenberg remain with
DirichletPadicLFunctions. The exact contracts and Needs lists have been
reconciled with that division. No supplier file or packet was edited.

The maintainer can point the existing
`DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing` application back to
§4.18 for the arithmetic-vector deduction. Its generic Baker–Brumer
input remains `IntegralIwasawaTheory:L4/baker-brumer-independence`,
which imports LinearFormsInLogarithms §8.10 through
DiophantineApproximationAndTranscendence DT.3. No ownership move for a
generic theorem is needed.

The existing supplier obligations for the general finite primitive-unit
index formula and independent dyadic reflection in arithmetic μ=0 are
still stated as planned mathematical inputs. This fix supplies the
norm-limit, bounded-correction and four application comparisons; it does
not certify the implementation of those supplier roadmaps. The unchanged
packet still records four gaps and twelve requests. None was silently
marked closed by this package-only fix. No unresolved package finding
from the four-item report remains.

## Adversarial pass on the touched statements

Rows group the explicitly stated identities in one comparison only when
they use the same hypotheses. These are mathematical specification checks;
the named admitted Lean targets are not evidence of a proof.

| Statement or convention | Instances and boundary computation | Result and change |
|---|---|---|
| §3.3 actual descent map and finite coinvariants | Odd p, nontrivial and trivial Δ-parts, n=0 and large n; zero module | Belliard supplies finiteness at every level and a uniform bound. The trivial tower is removed through §3.2, with bounded finite-level error. |
| Stabilized kernel calculation | A stabilized finitely generated cokernel with nonzero finite torsion | Only the finite image of the descent kernel lies in the torsion subgroup. Added that distinction; no finiteness of the whole stabilized module is assumed. |
| Fixed-field norm calculation | Norm images scaled by [L_n:D], with a nontrivial fixed finite lattice index | The index stays bounded after the common scale; it is not set to zero. |
| Primitive circular norm-limit adapter | Primitive conductor, an extra prime, a lower positive p-level and the fixed base conductor | Distribution gives the first three spans; the residual fixed-layer system has norms multiplying by p and inverse limit zero. Compact inverse-limit exactness identifies the limits. |
| Full Sinnott correction | Real general conductor, square saturation, p odd versus p=2 | Eventual correction is 2^[L_n:ℚ] times a fixed rational. Only its odd-p valuation is bounded here; no dyadic assertion was added. |
| Finite descent length sign | Zero map ℤ/9→ℤ/3: kernel 9, image 1, cokernel 3 | Target minus source length is 1−2=−1. README and proved Lean example agree. |
| Growth versus characteristic ideals | T and T−p have equal μ,λ but different ideals; unit quotient | Growth supplies μ,λ only. Existing componentwise divisibility remains essential in §3.4. |
| §4.7 m=1 reduction | F=ℚ, p=5, ρ=ω²; also p divides [F:ℚ] | Rational norm/extension works after inverting p; the nontrivial-Δ generator lemma is not applied. At p=2 even nontrivial Φ-character is impossible. |
| Unit series and real/principal adjustment | h₂=2−X, a=1, a divisible by p | Constant 2 is a unit at p=5; a=1 gives zero image; p∣a is excluded. Root and Teichmüller adjustments are killed by the stated maps. |
| Coleman constant-term condition | (2−X)^4 over 𝔽₅ has coefficients 1 at degrees 0 and 4 | The whole polynomial is not 1. Corrected the congruence and proved the two-coefficient Lean test. |
| D, ∂ and raw/normalized sign | Dlog h₂=−(1−X)/(2−X); at p=5 the boundary linear coefficient is −1 | DC=−C∂, Col=−Col₀ and Θ=C∂A give the recorded sign. Polynomial and power-series Lean tests are proved. |
| Frobenius and smoothing | 2Y²/(1−Y²)−Y/(1−Y)=−Y/(1+Y) | Denominators 1±Y are explicitly nonzero in the proved field example. The analytic series is the regular smoothed expression. |
| Independently normalized Stickelberger image | ν′≥2, Y primitive p^ν′-root, Y^p≠1 | Finite weighted sums give the two rational terms before smoothing. Evaluations separate bounded-coefficient series; the ring is Λ[1/p], not unrestricted ℚ_p[[T]]. |
| S_a and character weight | p=5, ρ=ω², a=2; S_a mod 5 is −2=3; a=1 gives 0 | Unit cancellation requires the nontrivial Φ-character. Θ has covariance b[b], giving ρω⁻¹=χ⁻¹ before twist. |
| Γ-inversion | (1+T)(1−T+T²)=1+T³ | The quadratic coefficient is +1, absent from −T. Proved Lean witness retained separately from Z↦−X. |
| §4.18 rational minus valuation module | Two split primes of ℚ(√−7); real unit 2 and α/ᾱ | The real vector dies; the minus vector has unequal valuations. The kernel is torsion and the finite ideal-class obstruction dies over ℚ. |
| Actual Gauss projection | Primitive odd χ, B₁≠0; even or trivial χ as excluded boundaries | Its nonzero valuation proves the actual algebraic vector nonzero. No abstract arbitrary vector or integral idempotent substitutes for it. |
| Rational logarithm injection | log₂(2)=0; minus y with log₂ι(y)=0 | Splitting gives y=±2^k; the minus norm forces k=0. The assertion fails before removing the real part. |
| Baker–Brumer application | Algebraic local units obtained by removing the p-valuation; p=2 and a common deep power | Logarithms are unchanged. The generic theorem is used only for algebraic coefficients; no unrestricted p-adic linear-independence assertion is made. |
| λ/G2 matching and derivative | g_F versus a Gauss sum outside F; χ inverse indexing; zero artificial log | Norm and character sum match the actual λ. Its nonzero value precedes the derivative conclusion; G2 alone is insufficient. |
| §4.21 faithful reduction and nonsplit error | Trivial p-Sylow, nontrivial cyclic p-Sylow, χ(p)≠1 | Prime-to-p kernel descent is invertible. The finite control error has length v_O(1−χ(p)), equal to the analytic Euler-factor valuation. |
| Odd-p valuation and log lattices | p split, no μ_p, all odd character lines; a nonfaithful line imported from its cut-out field | Valuation is injective; each log line is nonzero by the Gauss/Baker argument. Semisimplicity is used only over a splitting field. |
| V_i and finite exact sequences | i=0 and i>0; W_i/V_i nonzero | Lower full W_(i−1) is used. Finite lattice quotients are retained and cancel through actual isomorphisms. |
| Control defect via local norms | n large; local log norm p^(n+1)ℤ_p and denominator p^nW_i | The quotient is pI_i/λ_iW_i. No capitulation term is discarded or replaced by a bounded unspecified factor. |
| Successive valuation/log indices | s=1 and s>1; O/O′ ramified with identical residue fields | Quotient by N_C is O. Cokernels have lengths v_O(B₁) and v_O(R); conductor and log(u)/p factors are units. O-length is not confused with v_p. |
| Reduced series and Euler characteristic | Rank p^i split-prime part, i=0/1; compact Λ/(T−p) has finite quotients | Factor is T^(p^i). Finite submodules, not finite quotients, must vanish in the compact dual. Corrected the proof route. |
| Faithful character quotient | C₃ acts on ℤ/9 by 4; norm is 3, image {0,3,6} | Kernel and cokernel have order 3. Proved Lean example rejects an exact integral p-Sylow projector. |
| Base and successive class lengths | s=0 versus s>0, unit Bernoulli index | Base log/control terms cancel; successive differences cancel by the displayed formulas. Since p is odd, ½ contributes no valuation. |
| `quartic_norm_sign_test`, `sixthRoot_sub_one_test` | Primitive fourth/sixth roots, characteristic zero; degree-one bottom step | Norms are 2 in the quartic case and ζ−1=ζ² in the sixth-root case. Converted admitted examples to named README theorem targets without changing hypotheses. |
| `chiSum_regular_sign_test`, `chiSum_orderFour_frobenius_test` | Order 2 sign, order 4 value i; arbitrary finite group in the latter | Values [1]−[s] and factor 1+i fix the inverse convention. Named theorem targets replace admitted examples. |
| `seventhRoot_inverse_frobenius_test` | Primitive seventh root, exponents 4 versus 2 | First product is 1−η; the altered product differs. Characteristic-zero and primitivity assumptions retained in its named target. |
| `chiComponent_domain_test` and proved component tests | Domain as its own module; torsion ℤ/2; trivial character and zero module | Scalar injectivity is module-dependent. Proved examples use the actual definition and library invariants, not admitted API lemmas. |
| Proved `chiSum` tests | Trivial character over ℤ, arbitrary finite group, group of order 1 | Sum is cardinality times the input; the trivial-group value is 5. Exactly two proved tests for this kept definition. |
| Proved ratio and root-order controls | ζ≠0,1 in any field; ζ=0 over ℚ; ω=−1,n=2 over ℤ | Field calculation is valid in arbitrary characteristic under its exclusions. Zero is the counterexample if omitted; 2 is not a unit in ℤ. |

Arithmetic statements retain their number-field and mixed-characteristic
coefficient hypotheses. They assert nothing for equal-characteristic DVRs,
characteristic-p global fields or noncompact replacements of the compact
norm limits. Generic character identities retain arbitrary commutative
coefficient rings. The two real-bodied definitions are unchanged; there
are two proved tests for each. Six formerly admitted examples are now
named theorem targets in the README. All remaining examples have proofs.

## Source verification record

All text in the deliverables is independently phrased. The following
primary sources were read at the relevant locators; SHA-256 values identify
the downloaded public versions, accessed 19 October 2026.

| Source and locations read | Public version | SHA-256 |
|---|---|---|
| Belliard, Theorem 1.1, Lemmas 3.3, 4.1–4.2, 5.1–5.2, Proposition 4.3, Theorems 5.3, 6.1, preprint pp.4–5, 12–16 | [arXiv v1](https://arxiv.org/pdf/0912.2528) | `851ef8a69febd3dbfbda19645cbe41c552851c4678ab8da335cd7b4c46ee31c9` |
| Sinnott, introduction theorem p.182, Theorem 6.1 p.226, §7 pp.232–233 | [GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0062/LOG_0014.pdf) | `ca496fb4f381eb97cb51bb25449d69a2f642bdcce6f93f2f0f61b143fda19637` |
| Solomon, Lemma II.2 pp.470–471, Theorem II.1 p.472, Propositions II.2–II.3 pp.476–479, III.1–III.2 pp.481–484, Lemmas III.1–III.5 and Corollary III.3 pp.485–491 | [Numdam](https://www.numdam.org/item/10.5802/aif.1221.pdf) | `c207989da1f0efd8bc4a8344a9880adbf5cebf3d3b217a0923642c9d8cdaed64` |
| Mazur–Wiles, §1.10, Propositions 2–3 and cyclic divisor/norm diagram, pp.218–224 | [GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0076/LOG_0020.pdf) | `4cb3aa5017548e342a221724c3c5d38c3f19721053ccbbdd8a20bb3e0ba463d9` |
| Greither, definition p.458, Lemmas 2.11, 2.15 and Theorem 2.13 pp.463–468, Theorem 4.1 pp.482–484, Gauss definitions and G1/G2 pp.490–492 | [Numdam](https://www.numdam.org/item/10.5802/aif.1299.pdf) | `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da` |
| RJW, §§10.2–10.3 pp.48–49, Theorems 12.17, 12.23 and §§12.3–12.4 pp.62–65 | [arXiv v2](https://arxiv.org/pdf/2309.15692v2) | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |
| Rubin, III.2.8 p.38 and primitive-character conventions in III.2 pp.34–39 | [AWS author draft](https://swc-math.github.io/notes/files/99RubinES.pdf) | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| Gross–Dasgupta, §2 pp.3–5, valuation/log regulator and algebraic-coefficient discussion | [Author manuscript](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf) | `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027` |

The original Gross Tokyo PDF was unavailable in this run. The replacement
nonvanishing argument above does not depend on its §4. No uncleared book
copy was used, and no source file or passage is included in the repository.

## Library, structure and validation

The reviewed coverage audit and the relevant supplier targets were read.
The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Current roadmap main was `0d144d044dacebca17b654695b6f1ad58f159b27`
and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
LocalGaloisGroups and ProfiniteArithmetic were the upstream form/ownership
models. Scoped object searches included all nine newer roadmap directions,
nested OperatorTheory parts and the Completed roadmaps. No existing
circular-unit descent, Coleman normalization or arithmetic Gauss-log
comparison duplicating these additions was found. Completed group
algebras, local multiplicative completions, powering and finite-field Gauss
sums retain their existing owners; their relevant statements were read.
No Lake command was run in either read-only checkout.

The package retains all 75 original target anchors, all 55 original API
items, all 56 named tests and their 13 definition groups. The 59 fine-grained
external references resolve to supplier nodes, and local Needs links point
backward. The new elementary Lean proofs use pinned power-series
coefficient, polynomial and representation APIs, whose statements were
checked. The original 29 baseline references were not replaced or given a
new blanket re-audit claim.

Validation commands and results:

- `lean-check research/blueprint/packages/EulerSystemsCyclotomicMainConjecture/Suggested.lean`:
  exit 0, only 21 `declaration uses sorry` warnings. No admitted examples.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/EulerSystemsCyclotomicMainConjecture/Suggested.lean`:
  exit 0, no admitted data.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`:
  0 errors and 0 warnings; the packet is unchanged.
- Intake file check on the four deliverables: 0 problems.
- `git diff --check`: passed.

The handoff contains the continuation information; temporary downloads and
extraction files are not needed by the next worker. No second job was taken.
