# Independent review of EllipticRegulators ER.5

Accepted after corrections as a complete **target-level planned pass**. The
stage remains planned, with five precise owner requests and assembly work;
it is not closed or implemented. Reviewer: Codex, session `codex-PVOz7e`,
job `REV-EllipticRegulators--ER.5`, 2026-10-06. The author of the reviewed
planning job was the different session `codex-0vAUOp`.

The final packet has 10 new nodes: one definition, three comparisons, three
theorems and three applications. Its independent verdicts are six verified
and four corrected, with no unverifiable or added nodes. It imports eight
parent targets and two existing AL.1 local-factor nodes, retains eight
confirmed baseline citations, and has nine API items, seven definition
tests, two new planets, five requests and no local mathematical gaps.
The two parent planets make four for ER.5 after assembly.

The reviewed files are the [packet](../packets/EllipticRegulators--ER.5.json)
and [suggested file](../suggested/EllipticRegulators--ER.5.lean). I also read
the complete [part reader](../readmes/EllipticRegulators--ER.5.md), the parent
targets and errata, the reviewed ER.4 analytic suppliers, relevant E.7/E.3
contracts, the CM owner stages, the AL.1 local-factor statements, the library
audit and the nearby upstream EllipticCurves and GlobalNumberFields documents.

## Corrections made

The normalization certificate previously attached a minus sign to the
**dual-first** Γ while discussing the opposite kernel. Define
Γ_op = −Γ for that kernel. The corrected equality is

\[
 L(2,\psi)=\frac{\pi\Gamma}{iy^2C^4}R_q(U)
          =\frac{-\pi\Gamma_{\mathrm{op}}}{iy^2C^4}R_q(U).
\]

The two expressions give the same L-value. Using −πΓ with dual-first Γ
would reverse the verified Gaussian value. The suggested file now contains
a corresponding scalar diagnostic with the explicit hypothesis Γ_op = −Γ.

I added the conductor-fiber evaluation and ideal nonvanishing as direct
prerequisites of the certificate, and primitive Gauss normalization and
CM.4 as direct prerequisites of the worked examples. These are facts the
proof sketches actually invoke. No proof was split into lemma nodes.

The raw finite scalar gained `cmGaussCoefficient_congr`, so pointwise equal
weights can be substituted without unfolding it. A seventh definition test
replaces f by if and g by −ig in the Gaussian case: the Fourier input changes
from (1,1) to (3,1), while Γ stays 2. The suggested file includes both changes.
The primitive norm and reality statements retain their stronger CM hypotheses;
the raw linearity API does not assert those properties for arbitrary weights.

The whole-stage AL.1 request was redundant once its finer packet nodes were
read. I replaced it with `AL.1/unramified-local-theory` and
`AL.1/ramified-local-theory`, added their direct dependency edges and made the
unitary convention explicit. Away from the conductor, use parameter
ψ(P)/N(P)^(1/2) and argument s−1/2. At ramified primes, the local-character
factor is 1. The ideal coefficient ψ(P)=0 is its zero-extension convention,
not a zero value of a multiplicative local quasi-character. CM.4 still owns
the full elliptic comparison, including all bad primes and the conductor.
The AL packet is an existing plan; this review does not accept that whole packet.

I expanded the Gaussian row-series proof: regrouping by unit symmetry reduces
it to an alternating quadratic-denominator row, whose cotangent evaluation
can be differentiated locally uniformly away from its poles. This justifies
the arithmetic check instead of merely naming a numerical formula.

I corrected Brunault's thesis title to the title on its cover, recorded the
public Bloch HTML hash obtained in this review, scoped its provenance to the
actual transcription, added the real-structure source locator, and converted
`upstreamNotes` to the protocol's `roadmaps`/`note` shape. Each baseline entry
now records the independent statement check. `LSeries_normCoeff`'s summary
explicitly says that its index is the nonzero integral ideals. No baseline
citation was removed or replaced, and no new mathematical node was added.

## Sources and inherited errata

For [Bloch, CRM Monograph Series 11](https://dokumen.pub/higher-regulators-algebraic-k-theory-and-zeta-functions-of-elliptic-curves-0821821148.html),
I read Lecture 11 §§11.1–11.2, printed pp.87–93, through the final corollary
and conjecture. The publicly available HTML preserves the locators but loses
overlines and some mathematical glyphs. The packet's excerpts are literal
anchors; all ten Bloch anchors were checked. The corrected bars and Fourier
sign are established by coordinate algebra and the independently reviewed
ER.4 identity, rather than inferred from damaged glyphs. This review does not
claim collation against publisher page images. The updated raw HTML SHA-256
is `f6f64f09e412c623adccec9744c052df811a8fb420f0fb1e7d319237937abc75`.

For [Brunault's thesis, arXiv math/0602186v1](https://arxiv.org/pdf/math/0602186v1),
I checked the cover, §0.5 p.11, and §1.2 pp.20–28, including Theorem 21,
Remark 20 and Proposition 26. Its SHA-256 matches the input:
`8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`.
The added (1.64) excerpt is literal. The real-period normalization supports
the selected conjugation transport; the comparison with Bloch's complex
regulator remains ER.4's. Theorem 21 invokes Bloch's analytic identity and
is not used as an independent proof of that identity here.

The part has no new canonical source-issue entries. It imports E7/E8/E9 from
the already reviewed parent; each import now has this review's own confirmed
verdict and reason:

- E7: the dual-first transform equals C times Lecture 10's transform at the
  same output. An odd input changes sign under the opposite kernel. The
  Gaussian values 1+i and −1−i distinguish the conventions.
- E8: element-to-ideal generator fibers and residue-to-unit-orbit fibers both
  have size |μ|. Their factors cancel in the L-value formula.
- E9: distribution partitions residues invertible modulo f. Full-level units
  give a smaller set when g introduces extra primes. The level-14 finite
  calculation and regulator diagnostic distinguish these sums.

These are inherited findings, not new claims about the published book.
The author's public publications page and the arXiv record were also checked;
no additional source issue is asserted from the damaged transcription.

## Baseline statement audit

Every declaration below was read in source at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including its namespace and hypotheses.

| Declaration | Statement that is actually consumed |
| --- | --- |
| `WeierstrassCurve.LSeries` | For a Weierstrass curve over a number field, the scalar L-series is formed from its arithmetic L-function coefficients. The local polynomials use the minimal reduction and include additive factor 1. This definition supplies no Deuring comparison. |
| `ZMod.stdAddChar` | With a nonzero modulus, the standard additive character has positive exponential sign exp(2πij/C). |
| `cot_series_rep` | For a complex argument outside the integers, πcot(πz) is its **paired** positive-integer partial fraction sum. The row calculation justifies regrouping and differentiation separately. |
| `TauCeti.MultiplicativeIdealWeight` | A total zero-preserving multiplicative ideal weight with finitely many killed height-one primes, compatible with finite conductor zero extension. |
| `TauCeti.norm_idealTerm` | On nonzero integral ideals, the term norm is the weight norm divided by N(I)^Re(s). |
| `TauCeti.LSeries_normCoeff` | Summability of ideal terms identifies the norm-regrouped scalar L-series with the sum over nonzero integral ideals. |
| `TauCeti.summable_absNorm_rpow_ideal_iff` | For a number field and real t, summability of N(I)^(-t) is equivalent to t>1. Here t=Re(s)−1/2. |
| `TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm` | Summability of the multiplicative ideal terms already implies nonvanishing. It requires no additional real-part bound. |

The source modules are identified in the packet. The CM specialization uses
the existing ideal carrier and Euler theorem; it does not duplicate either.
The reviewed library audit's missing CM/Hecke interfaces remain owner requests.

## Node and dependency audit

The packet's `review.checked` contains one detailed verdict for every node.
The following table records the principal check; IDs have prefix
`EllipticRegulators:ER.5/`.

| Node | Verdict | Principal check |
| --- | --- | --- |
| `dual-first-fourier-comparison` | verified | Same output coordinates; factors C and C³; direct ER.4 analytic proof independent of ER.5. |
| `cm-gauss-coefficient` | corrected | Raw finite scalar, conditional primitive API, congruence and generator test. |
| `primitive-gauss-normalization` | verified | CRT unit lifts, conductor support, counting Parseval, conjugation, generator independence, signed Γ=±N(g). |
| `conductor-fiber-regulator-evaluation` | verified | Factorization C=f̄ḡ gives prefactor g and the full W fibers, using one fixed class level C. |
| `unit-orbit-regulator-count` | verified | Free unit action, injective index image, equal orbit cardinalities, conditional rational descent. |
| `principal-generator-L-series-comparison` | verified | Principal-ideal law and absolutely convergent regrouping over |μ| generators. |
| `cm-ideal-series-at-two` | corrected | Norm exponent Re(s)−1/2, exact pinned nonvanishing implication, finer AL imports and norm-half convention. |
| `unit-factor-cancellation-certificate` | corrected | Both |μ| factors cancel; opposite-kernel Γ is distinguished; missing direct prerequisites added. |
| `three-CM-normalization-examples` | corrected | Exact finite tables, sign choices, explicit Gaussian row proof and independent diagnostics. |
| `extra-prime-level-counterexample` | verified | Exact level-14 set and orbit counts; factor-two comparison remains a numerical diagnostic. |

The eight parent targets retain their identities and API/tests. I checked their
contracts for the CM datum, U, the L-value theorem, nonvanishing, finite Fourier
transform, lattice identity, same-level CM distribution and character Fourier
support. Their use in this part is subject to the recorded ideal-conductor and
real-structure qualifications. E.7 supplies certified classes and rational
Galois descent with inverse norm/[L:ℚ]; E.3 supplies the rational identification
with curve K₂ over a number field. Neither supplies integrality or generation.
AC.0's probability-normalized Parseval becomes counting Parseval after the
C rescaling on the C²-element residue group. Its whole packet is not claimed
to be independently accepted by this review.

Confirmed red-team finding `RT-AREA-ktheory-2/5` is handled in both the packet
and the reader: CM.1 owns the action/lattice and CM.4 owns ψ, conductor and
Frobenius/Deuring theory. ER.5 consumes those interfaces. CM.2 owns the actual
torsion-field Galois action, and GlobalNumberFields owns finite-conductor and
infinity-type carriers. The requests explicitly ask for the additional
all-prime comparison and real-structure normalization that the current owner
stage summaries alone do not prove.

## Independent calculations and validation

I derived the Gaussian and Eisenstein characters by congruence with the units
modulo their conductor ideals, and the √−7 character by reduction a+4b modulo 7.
Finite computations used rational polynomial arithmetic modulo Φ₄, Φ₆, Φ₇ and
Φ₁₄, with integer-coordinate multiplication in ℤ[τ]. These checks were exact:

| Field and level | Γ | W residues | Unit orbits | Full-level units | Fourier support size |
| --- | ---: | ---: | ---: | ---: | ---: |
| ℚ(i), 4 | 2 | 8 | 2 | 8 | 4 |
| ℚ(√−3), 6 | 3 | 18 | 3 | 18 | 6 |
| ℚ(√−7), 7 | 7 | 42 | 21 | 42 | 6 |
| ℚ(√−7), 14 | 28 | 168 | 84 | 42 | 6 |

I also checked character multiplicativity on every pair in W, every nonzero
Fourier coefficient's norm, the exact support set and each change of conductor
generator by a unit. The Gaussian index image is {(1,0),(3,2)}; the Eisenstein
image is {(1,0),(3,2),(5,4)}. For √−7 the quadratic Gauss square is −7; the sine
comparison in the packet selects its positive imaginary square root.

Separate mpmath 1.3.0 calculations used 60 decimal digits and 40 forward and
backward q terms, comparing also with 32 terms. They reproduce the reader's
three regulator/L-value pairs and the level-14 regulators
870.352604165136888924379523858885…i and
1740.705208330273777848759047717771…i. The Gaussian alternating arithmetic
row sum through odd a=79 differs from its regulator-derived L-value by about
1.63×10⁻⁵⁷. Truncation and precision comparisons exceeded 10⁻⁵⁰ agreement.
These are reproducible numerical diagnostics, without certified error bounds.

`python3 scripts/check_blueprint.py` on the corrected packet reports
**0 errors, 0 warnings**. `lean-check` on the revised suggested file exits 0
at the pinned Mathlib version, with exactly 24 declaration-placeholder
`sorry` warnings and no other warnings or errors. Available memory was checked
before each of the two sequential elaborations. The Tau Ceti baseline modules
were read at the pin, but their illustrative commented signatures were not
elaborated because prebuilt object files were unavailable. CM/K₂ carriers
remain unavailable and their signatures are honestly omitted/commented.
No library build was performed. The intake file check reports four files and
zero problems, and `git diff --check` passes.

## Assembly handoff

No mathematical decision is pending for this part. Assembly must apply the
precise `coverage.remaining` instructions to the read-only parent and reader:

1. Attach the parent L-value and nonvanishing targets to the new certificates;
   remove the parent's obsolete natural-number Euler-product near miss.
2. Correct `cmHeckeCharacter_conductor` from f̄=f as elements to f̄O=fO as ideals.
3. Put the selected uniformization's conjugation compatibility explicitly in
   the parent U descent contract and tests, retaining the actual Galois image.
4. Replace the broad AL.1 dependency/request by the finer imported nodes;
   update the reader's request/API/test lists accordingly.
5. Correct the reader paragraph after its boxed L-value formula to distinguish
   Γ_op from Γ, using the equality displayed above.

The issue does not authorize edits to those parent/reader files. The accepted
part states the correct qualified contracts and records these assembly edits
explicitly; the combined roadmap must carry them through. Custom `imports`
metadata alone does not rewrite parent nodes. See the
[handoff](../handoff/REV-EllipticRegulators--ER.5.md) for the retained continuation
information. No promotion or upstream roadmap edit was performed.
