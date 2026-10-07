# HB.2 revision 2 handoff

Job `BP-HabiroNumberFields--HB.2~2`, [issue #6969](https://github.com/CBirkbeck/tauceti-explorer/issues/6969).
ChatGPT GPT-6 Astra Pro — session `chatgpt-5c67bc37a117`, 2026-10-07.
Claim comment 6043943738 was confirmed by bot comment 6043946789 before work began.

## Result and scope

**The reader now incorporates every correction requested by
[REV-HabiroNumberFields--HB.2](../reviews/REV-HabiroNumberFields--HB.2.md).**
This revision rechecked the changes that the reviewer had already made in
the packet and suggestion. No additional material defect was found in those
files, so they are unchanged. The submission changes the definitive
[reader](../readmes/HabiroNumberFields--HB.2.md) and this handoff only.

The [packet](../packets/HabiroNumberFields--HB.2.json) remains a complete
target-level planning pass. HB.2 remains `planned`, with five explicit
remaining obligations; this revision does not close those proofs. The
existing `review` object, including its `needs_changes` verdict, and all five
source-finding review records are preserved for the next independent reviewer.
This session's internal verification is part of the authoring work and does
not replace that review.

| Inventory retained | Count |
| --- | ---: |
| New nodes | 4: one construction, two theorems, one comparison |
| Parent HB.2 imports | 28 |
| Construction API statements | 8 |
| Construction unit tests | 4 |
| Baseline citations | 6 |
| Supplier requests / gap records | 7 / 3 |
| Confirmed source findings | 5 |
| Proposed stage edges | 8 |
| New planets | 1, the KMS identity |

The planet proposal still retains five parent landmarks and adds KMS,
with the parent's unconditional Hutchinson-refinement landmark rescoped to
HB.5. The reader now makes clear that obtaining the six-landmark selection
requires the maintainer to apply that parent rescope. No parent node, id,
source locator, API, test, or ownership assignment was replaced.

## Corrections made in the reader

| Review requirement | Revision |
| --- | --- |
| Convergence neighborhood | Section 3.1 now uses a sufficiently small simply connected complex neighborhood of `(X,Y)=(1/5,2)`, analytic nth roots, `|X/Y|<|Z|<1`, and `Re S>0`. It starts on generic nonreal parameters, gives the backward recurrence for removable negative-index summand singularities, and includes the review's counterexample to the former broad real-domain claim. Section 3.2 and the P.1 request use this same center and compatible branches. |
| Odd-prime-power hypothesis | Section 5 explicitly assumes `N=ℓ^m≥3`, with ℓ an odd prime and `m≥1`. The bar specialization keeps its broader odd-N hypothesis. |
| Bott and Chern provenance | Section 5 cites Hutchinson v4 p.6 for the explicit Bott Chern value, p.5 for the negative product coefficient, and distinguishes Soulé's degree-one Kummer normalization. Section 4 identifies Proposition 4.6 on p.7. |
| Left/right resolution compatibility | Sections 1 and 4 distinguish the 2013 left resolution with `t−1` from the parent's 2024 right resolution with `1−t`. The degree-three coinvariant chains coincide; the degree-two chains have boundary `N[t]` and agree by the injective positive coefficient Bockstein. |
| Source findings and verification status | Sections 3 and 8 acknowledge EHB2.5 and the existing confirmation of all five findings. The provenance separates the previous review's source access and partial Lean result from the checks actually performed in this revision. |

The reader also calls the common QM.0 analytic estimates and V.4 refined
cyclic formula requested supplier results. It preserves the distinction
between an exact target specification and an existing proof export.
The final reader comparison also made section 4's primitive-Nth-root
hypothesis explicit, matching the existing packet statement and the
generators subsequently retained by section 5.

## Mathematical checks of the review's corrections

For the analytic center, exact rational arithmetic gives
`Z=−4/5`, `S=4/9`, and `|X/Y|=1/10<4/5<1`. The Gaussian coefficient is
`−9/4`. The counterexample `(X,Y)=(9/10,2)` gives `Z=−1/10` and
`|X/Y|=9/20>|Z|`, confirming that the former reader condition was
insufficient. The center also gives `C=169/36`, `C/S=169/16`, and
`(1−YZ)/(1−X)=13/4`, fixing the positive square-root choice. All seven
variable dilogarithm arguments lie below one, so a small principal-branch
neighborhood exists.

For `k≤0`, the backward recurrence
`A_(k−1)=A_k(1−q^k x)/(z(1−q^k y))` has nonzero denominator because
`|y|>1` and `|q|<1`. For nonnegative indices, `|x|<1` keeps the forward
denominators nonzero. This repairs the negative-index interpretation without
claiming the required uniform two-sided estimates. The exact q-product
shifts must precede the fixed-argument limit; their correction relative to
the printed shifted-D ratio is `4/13` at the center. The full complex
identity `B=0`, rather than only its Bloch–Wigner imaginary part, remains
requested from P.1.

The finite KMS statement and its hypotheses agree with CGZ §2.5 and GZ
Appendix A. The integral-specialization route keeps the monic quotient over
`Z[t]/Φ_n(t)`, its free reduced basis, the simple-divisor irreducibility
argument and the nonzero-factor hypotheses. It does not assume an embedding
of a positive-characteristic field into the complex numbers.

For the bar comparison, applying
`d[a|b]=[b]−[ab]+[a]` to each degree-two sum gives `N[t]` by telescoping.
The coefficient exact sequence with multiplication by positive N therefore
gives the same Bockstein. Since `H₂(C,Z)=0`, this map is injective and the
two finite-coefficient classes agree. This checks the claimed compatibility
without identifying the resolutions themselves. The auxiliary correction
remains `[0]`, including at N=3, and the determinant-one conjugating matrix
preserves the diagonal conjugation.

The signed evaluation keeps the standard Kummer cocycle `σ(α)/α`, positive
Bott boundary and fixed untwisting. The raw product formula gives the inverse
power class; independently negating the degree-(2,1) map gives the positive
value. The bidegrees `(1,0)` introduce no extra graded sign. This does not
identify the fixed CGZ/GSWZ map. The parent's E14 sign-comparison gap remains
open, and inverting the Chern map still inverts its square. Restriction in
the Bott argument takes place in K-theory, not in the Bloch quotient that
can kill the cyclotomic class.

## Baseline, suppliers and the four red-team findings

The reviewed `AUDIT-28` result and accepted `REV-AUDIT-28` were read for HB.2.
They mark the specialized stage not built; generic power-class and Kummer
support does not implement these four targets. The enclosing hypotheses and
actual source declarations were rechecked at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Pinned declarations | Contract used |
| --- | --- |
| `IsPrimitiveRoot`, `IsPrimitiveRoot.geom_sum_eq_zero` | Exact-order convention and the domain geometric-sum theorem for order greater than one. |
| `TauCeti.powerClassQuotient`, `TauCeti.powerClassHom` | The actual commutative-group quotient by nth powers and its quotient homomorphism. |
| `TauCeti.kummerClassMap`, `TauCeti.kummerClassMap_injective` | The standard continuous Kummer cocycle for n invertible in the field, with injectivity only at the pin. |

The six declarations occur in the modules recorded by the packet. The
suggestion's `Mathlib.Basic.Complex.Basic` import was also checked at the
Mathlib pin. All 28 parent ids resolve, and their statements and proof
qualifications were read. The supplement's sign and bar-convention
qualifications remain necessary for these imports.

Actual supplier statements were checked in K3BlochGroups V.2–V.5,
K2SymbolsBrauer T.2:symbols, QM.0–QM.1, Polylogarithms P.1 and HabiroNahmSeries
HB.4–HB.5, together with the relevant atlas stages. ProfiniteCohomology
Layers 8 and 9 were read for cups, continuous coefficient transport and the
explicit/canonical Kummer comparison. The full Kummer isomorphism is an
upstream import, not an inferred baseline theorem or a duplicate plan.

| Confirmed finding | Handling retained and checked |
| --- | --- |
| `RT-AREA-ktheory-2/2` | CGZ Theorem 7.4 is already owned by `HB.4/acceptance-andrews-gordon`; HB.5 receives the scalar-two assembly request using that theorem and QM.0–QM.1. There is no HB.4→HB.2 prerequisite. HB.5 exports the convention-qualified result to HB.9. |
| `RT-AREA-ktheory-2/13` | V.5 provides actual finite-field comparison and nonsplit-Cartan maps. Unstable homology inverts the characteristic; the false unrestricted integral order claim is not repeated. Orders alone do not identify maps or generators. |
| `RT-AREA-ktheory-2/18` | The generic finite-Chern construction has one requested owner, an early M.8 prefix requiring M.7. The unsplit late M.8 stage is not made an HB.2 prerequisite, and no unassigned split id is invented. |
| `RT-AREA-ktheory-2/19` | V.2 imports the existing single `T.2:symbols/milnor-number-field` statement and its G-Bass-Tate proof gap. Arithmetic proof closure is requested after T.7 with the real-place inputs, avoiding a reverse edge into the whole T.2:symbols stage. |

The current link-map search results were inspected for actual links and
overlaps touching HB.2. The touching Chebotarev entry CH-L16 supplies
infinitude with finite-exception removal to the parent local-detection
interfaces and retains realizable simultaneous Frobenius conditions. It
does not duplicate an HB.2 owner. The eight unchanged proposed edges retain
the independent review's acyclicity verification; this revision does not
claim a fresh complete-atlas graph run. The after-split-only Chern request
remains outside that edge list.

## Source access and numerical provenance

On 2026-10-07 this revision re-read the public primary passages needed to
verify the corrections:

- [GZ, published text](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf), Appendix A, pp.235–237, including rendered pp.236–237.
- [CGZ, published text](https://math.uchicago.edu/~fcale/papers/CGZ.pdf), §2.5, including rendered p.398.
- [Hutchinson 2013 preprint](https://arxiv.org/pdf/1107.0264), identified as v2, §6.4, pp.32–33, and the refined configuration calculation.
- [Hutchinson 2024 preprint](https://arxiv.org/pdf/2104.14413), whose first page identifies v4, §2.1 p.2, §2.3 pp.4–5 and §4 pp.6–7.
- [Soulé's author-hosted thesis transcription](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), second part, Proposition 2.2.3.3 p.49 and §2.2.4.3 p.52 within pp.51–54.

The GZ PDF was 345,698 bytes and its SHA-256 was
`4b737361b21095a2b476e89002821f8dee37bc12385e1275b1f5422ef14fa4c8`.
The CGZ PDF was 723,804 bytes and its SHA-256 was
`8003ee09bfec725127f4b5c2058c5516834a91a160d9c4428d962b1e5a1f0212`.
Both match the packet. Versioned arXiv PDF endpoints were unavailable;
unversioned public endpoints supplied the identified preprints. No new byte
hash comparison was performed for the Hutchinson or Soulé texts. No new
access to their full versions of record is claimed.

All five GZ printed findings were checked at their recorded locators.
EHB2.3 remains an error in the leading constant; EHB2.5 is the editorial
reference slip. The packet's independent confirmation records and historical
erratum searches are preserved. This revision did not repeat the erratum
search or expand the inherited E14 finding beyond the inspected arXiv v4.

The exact rational checks above were performed in this revision. Finite
Dedekind-phase checks were repeated for every primitive root of orders
3, 5, 7 and 9: 18 cases, maximum relative floating-point discrepancy
`5.7e-14`. The previous author's and reviewer's 6354 finite-field KMS
checks and small-epsilon Gaussian checks remain historical evidence; they
were not rerun here. Numerical agreement does not close the analytic proofs.

## Validation and compilation

The official command

```text
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.2.json
```

reported **0 errors and 0 packet warnings**, with all imported node ids
resolved against actual fetched parent and supplier packets. The global
diagnostic says the declaration index is unavailable, so automated baseline
checking was for reference form only. Each of the six actual pinned source
contracts was checked directly as described above. The browser atlas catalog
was used for local stage recognition; CI supplies the complete checkout and
declaration index.

Static reader/suggestion checks retain all eight API declarations and all
four named construction tests. The suggestion has ten named declarations
and five examples, including its extra native F7 power-class acceptance
example. The two enhanced Bloch/Chern signatures remain explicitly unstated
at their real supplier boundaries; comments are not counted as declarations.
The finite D expression in KMS agrees with the parent polynomial evaluation.
The packet and suggestion are byte-for-byte unchanged from the claimed input.

**No Lean compilation was performed in this session.** No existing build at
both pins is available, and `free -g` reported 9 GB available, below the
WORKERS.md 20 GB threshold. No library build, cache download or language
server was started. The previous independent review elaborated only a
Mathlib-only extraction through `kms_oddOrder`; its complete-file attempt
stopped at the missing Tau Ceti PowerClassGroup object file. That result does
not validate the full file or its Tau Ceti example.

## What remains and where to resume

The next independent reviewer should compare the reader corrections above
with the preserved packet and existing review, then replace the review
object with that review's own verdict. The planning pass is complete;
mathematical implementation still needs exactly the five recorded obligations:

1. QM.0 common analytic product, bilateral and uniform-tail results, together with P.1's full complex five-term identity.
2. V.4's actual refined cyclic bar formula and homology-map compatibility.
3. The early M.8 finite-Chern prefix and the comparison with the fixed CGZ/GSWZ map.
4. Closure of the imported Bass–Tate original-proof gap with its arithmetic inputs.
5. HB.5's sign-qualified scalar-two assembly and HB.9 export using the already-owned CGZ Theorem 7.4.

The maintainer also applies the proposed parent-landmark rescope. No scratch
artifact is required to resume: the statements, locators, numerical outcomes,
source hashes, limitations and remaining interfaces are recorded here and in
the submitted reader and unchanged packet.
